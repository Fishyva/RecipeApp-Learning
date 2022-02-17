//
//  RecipeTabView.swift
//  Recipe List App
//
//  Created by Shechem Harrison on 2/14/22.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        TabView {
        RecipeFeatureView()
                .tabItem {
                    VStack {
                        Image(systemName: "flame")
                        Text("Featured")
                    }
                }
            ContentView()
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                    }
                }
        }
        .environmentObject(RecipeData())
        //make a environment object of recipedata so all the subviews can use the same data
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }   
}
