//
//  RecipeDetailsView.swift
//  Recipe List App
//
//  Created by Shechem Harrison on 2/13/22.
//

import SwiftUI

struct RecipeDetailsView: View {
    var recipe:Recipe
    @State private var selectedServingSize = 2
    var body: some View {
     
          
            ScrollView {
                LazyVStack (alignment: .leading){
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                  
                    // MARK: Picker
                    VStack(alignment: .leading) {
                        Text("Select your servings:")
                        Picker("",selection: $selectedServingSize ) {
                            Text("2").tag(2)
                            Text("4").tag(4)
                            Text("6").tag(6)
                            Text("8").tag(8)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    .frame(width:200)
                    }
                    .padding(.leading, 15)
                    Divider()
                // MARK: Ingredients
                    VStack(alignment: .leading, spacing: 10){
                    Text("Ingredients")
                        .font(.headline)
                    ForEach (recipe.ingredients) { item in
                        Text("⁃ " + RecipeData.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " +  item.name.lowercased())
                    }
                }
                .padding()
       Divider()
                // MARK: directions
                    VStack(alignment: .leading, spacing: 10) {
                    Text("Directions")
                        .font(.headline)
                    ForEach(0..<recipe.directions.count, id: \.self) { index in
                        Text(String(index+1) + ". " + recipe.directions[index])
                        }
                    }
                .padding()
                }
            
            .navigationBarTitle(recipe.name)
        }
       // .ignoresSafeArea()
        }
    
}

struct RecipeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        // create a dummy recipe to pass it into the detail view
        // so we can see a preview
        let recipeList = RecipeData()
        RecipeDetailsView(recipe: recipeList.recipes[0])
    }
}
