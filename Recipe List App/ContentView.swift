//
//  ContentView.swift
//  Recipe List App
//
//  Created by Shechem Harrison on 2/11/22.
//

import SwiftUI

struct ContentView: View {
    // Use environment object so subviews have access to the same data as main view
    @EnvironmentObject var recipeList:RecipeData
    var body: some View {
        NavigationView {
        List(recipeList.recipes) { r in
                // for navigation link you'll link your view and pass in whatver is needed but in this case we used r since the loop uses r
            NavigationLink(destination: RecipeDetailsView(recipe: r)) {
                 HStack(alignment: .top, spacing:10 ){
                    Image(r.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50, alignment: .center)
                        .clipped()
                        .cornerRadius(15)
                    Text(r.name)
                        }
                    
                    }
            }
          
        
        .navigationTitle("Recipe App")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(RecipeData())
    }
}
