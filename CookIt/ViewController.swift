//
//  ViewController.swift
//  CookIt
//
//  Created by Gokay Abay on 2021-01-19.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var tableView: UITableView!
  
  let recipes: [Recipe] = [.init(title: "Best Brownies", steps: ["step1","step2", "step3"], imageURL: "https://images.pexels.com/photos/45202/brownie-dessert-cake-sweet-45202.jpeg"), .init(title: "Banana Bread", steps: ["step1","step2", "step3"], imageURL: "https://images.pexels.com/photos/830894/pexels-photo-830894.jpeg"), .init(title: "Chocolate Chip Cookies", steps: ["step1","step2", "step3"], imageURL: "https://images.pexels.com/photos/230325/pexels-photo-230325.jpeg")]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    // this controller will be assigned as this tables delegate. This controller has to do the work
    
    tableView.delegate = self
    tableView.dataSource = self
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return recipes.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath)
    cell.textLabel?.text = recipes[indexPath.row].title
    
    let recipe = recipes[indexPath.row]
    
    if let url = URL(string: recipe.imageURL), let data = try? Data(contentsOf: url) {
      cell.imageView?.image = UIImage(data: data)
    }

    return cell
  }
  
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let recipeDetailViewController = segue.destination as? RecipeDetailViewController, let index = tableView.indexPathForSelectedRow?.row {
      //  the recipe only gets populated if we know the destination if our detail view AND we have a recipe row selected from the table
      recipeDetailViewController.recipe = recipes[index]
    }
  }
}

