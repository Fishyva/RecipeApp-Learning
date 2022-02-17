//
//  Recipe.swift
//  Recipe List App
//
//  Created by Shechem Harrison on 2/11/22.
//

import Foundation

class Recipe: Codable, Identifiable {
        var id:UUID?
        var name: String
        var featured: Bool
        var image: String
        var description: String
        var prepTime:String
        var cookTime:String
        var totalTime: String
        var servings: Int
        var ingredients: [Ingredients]
        var directions: [String]
        var highlights: [String]
}

class Ingredients: Codable, Identifiable {
    var id: UUID?
    var name: String
    var num: Int?
    var dem: Int?
    var unit: String?
}
