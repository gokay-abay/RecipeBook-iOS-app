//
//  File.swift
//  CookIt
//
//  Created by Gokay Abay on 2021-01-19.
//


class Recipe {
  var title: String
  var steps: [String]
  
  init(title: String, steps: [String]) {
    self.title = title
    self.steps = steps
  }
}
