//
//  RecipeDetailViewController.swift
//  CookIt
//
//  Created by Gokay Abay on 2021-01-19.
//

import UIKit

class RecipeDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var imageView: UIImageView!
  
  var recipe: Recipe?
  

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      tableView.delegate = self
      tableView.dataSource = self
      self.title = recipe?.title
      
      if let url = URL(string: recipe!.imageURL), let data = try? Data(contentsOf: url), let _ = UIImage(data: data) {
        imageView.image = UIImage(data: data)
      }
        // populate the imageview if recipe.imageUrl is in fact a URL that contains data
      
    }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return recipe?.steps.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "stepCell", for: indexPath)
    
    cell.textLabel?.text = recipe?.steps[indexPath.row]
    
    return cell
    
  }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
 */
    

}
