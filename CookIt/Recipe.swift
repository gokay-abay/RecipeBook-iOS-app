//
//  File.swift
//  CookIt
//
//  Created by Gokay Abay on 2021-01-19.
//


class Recipe {
  var title: String
  var steps: [String]
  var imageURL: String
  
  init(title: String, steps: [String], imageURL: String) {
    self.title = title
    self.steps = steps
    self.imageURL = imageURL
  }
}
