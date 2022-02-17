//
//  DataService.swift
//  Recipe List App
//
//  Created by Shechem Harrison on 2/11/22.
//

import Foundation

class DataService {
    //make this a static func so you dont need to call DataService instance
   static func getLocalData() -> [Recipe] {
        
        // step 1  Parse local json file
        let pathString = Bundle.main.path(forResource:"recipes", ofType: "json")
        //step 2 Get a url path to the json file
        guard pathString != nil else {
            return [Recipe]()
        }
        //step 3 Create a url object
        let url = URL(fileURLWithPath: pathString!)
        do {
        // step 4 Create a data object
            let data = try Data(contentsOf: url)
        // step 5 Decode the data with a JSON decoder
        let decoder = JSONDecoder()
            do {
                let recipeData = try decoder.decode([Recipe].self,from: data)
        // step 6 add UUID if its not in the json file
                for r in recipeData {
                    r.id = UUID()
                    // add UUID to ingredients inngredients 
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                }
        // step 7 return the recipes
                return recipeData
            }
            catch {
                    print(error)
                }
            }
                catch {
                        print(error)
            }
        return [Recipe]()
    }
}
