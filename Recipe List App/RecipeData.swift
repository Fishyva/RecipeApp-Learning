//
//  RecipeData.swift
//  Recipe List App
//
//  Created by Shechem Harrison on 2/11/22.
//

import Foundation

class RecipeData: ObservableObject {
    @Published var recipes = [Recipe]()
    
    init() {
        // Create an instance  of data service and get the data
        self.recipes = DataService.getLocalData()
    }
        //static func allows you to call the function out side of the class 
    static func getPortion(ingredient:Ingredients,recipeServings:Int, targetServings:Int ) -> String {
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.dem ?? 1
        var wholePortions = 0
        if ingredient.num != nil {
            // step 1 get a single serving size by multiplying demoninator by recipe service
            denominator *= recipeServings
            //step 2 get target portion size by multiplying numerator by by target size
            numerator *= targetServings
            //step 3 reduce fraction by greatest common divisor
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            //step 4 get the whole portion if numerator > demoninator
            if numerator >= denominator {
                // Calculated the whole and remainder portions and now we can assign to a string
                wholePortions = numerator / denominator
                
                numerator = numerator % denominator
                
                portion += String(wholePortions)
            }
            if numerator > 0 {
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator) / \(denominator)"
            }
            
            // step 5 express remainder as fraction
        }
        if var unit = ingredient.unit {
            
            // calculate suffix
            if wholePortions > 1 {
            
            if unit.suffix(2) == "ch" {
                unit += "es"
                } else if  unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                } else {
                    unit += "s"
                }
            }
            return portion + " " + unit
        }
       
        return portion
    }
    
}
