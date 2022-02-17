//
//  RecipeDetailsView.swift
//  Recipe List App
//
//  Created by Shechem Harrison on 2/13/22.
//

import SwiftUI

struct RecipeDetailsView: View {
    var recipe:Recipe
    var body: some View {
        
            ScrollView {
                LazyVStack (alignment: .leading){
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                // MARK: Ingredients
                VStack(alignment: .leading){
                    Text("Ingredients")
                        .font(.headline)
                    ForEach (recipe.ingredients) { item in
                        Text(item.name)
                    }
                }
                .padding()
                // MARK: directions
                VStack(alignment: .leading) {
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
