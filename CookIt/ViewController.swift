//
//  ViewController.swift
//  CookIt
//
//  Created by Gokay Abay on 2021-01-19.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var tableView: UITableView!
  
  let recipes: [Recipe] = [.init(title: "Best Brownies", steps: ["step1","step2","step3"]), .init(title: "Banana Bread", steps: ["step1","step2","step3"]), .init(title: "Chocolate Chip Cookies", steps: ["step1","step2","step3"])]
  
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
    return cell
  }
}

