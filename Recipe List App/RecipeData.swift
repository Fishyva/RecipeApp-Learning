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
    
    
}
