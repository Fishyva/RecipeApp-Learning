//
//  RecipeFeatureView.swift
//  Recipe List App
//
//  Created by Shechem Harrison on 2/16/22.
//

// Color(.sRGB) makes you make a RGB color

import SwiftUI

struct RecipeFeatureView: View {
    // Use environment object so subviews have access to the same data as main view
    @EnvironmentObject var recipeList:RecipeData
    @State private var isDetailViewShowing = false
    @State private var tabSelectionIndex = 0
    var body: some View {
        
        VStack() {
            Text("Featured Recipes")
                .font(.title)
                .fontWeight(.bold)
                .padding(.leading)
                .padding(.top, 40)
            GeometryReader { geo in
                TabView(selection: $tabSelectionIndex){
                    
                    ForEach(0..<recipeList.recipes.count) { index in
                            // only show those that are featured
                        if recipeList.recipes[index].featured == true {
                            // Recipe card button
                            Button(action: {
                                // will show recipe detail cheat
                                self.isDetailViewShowing = true
                            }, label: {
                                // MARK: Recipe card
                                ZStack {
                                        Rectangle()
                                        .foregroundColor(.white)
                                            
                                    VStack(spacing:0) {
                                        Image(recipeList.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                        //this will maintain the aspect ratio but still fill the space
                                            .clipped()
                                        Text(recipeList.recipes[index].name)
                                            .padding()
                                    }
                                }
                            })
                                .tag(index)
                                .sheet(isPresented: $isDetailViewShowing ) {
                                    RecipeDetailsView(recipe: recipeList.recipes[index])
                                }
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100)
                            .cornerRadius(30)
                            .shadow(color: .gray, radius: 30)
                            // we made a zStack so the image and text will display over our rectangle
                        }
                        
                    }
                }
                //this allows the items in the tabview to be swiped sideways
                .tabViewStyle(PageTabViewStyle())
                // this allow the small indicator at the bottom to always show no matter the background
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                
            }
            VStack(alignment: .leading) {
                Text("Preparation Time:")
                    .font(.headline)
                Text(recipeList.recipes[tabSelectionIndex].prepTime)
                Text("Highlights:")
                    .font(.headline)
                RecipeHighlights(highlights: recipeList.recipes[tabSelectionIndex].highlights)
            }
            .padding(.trailing,200)
            .padding(.bottom, 25)
        }
        .onAppear(perform: {firstFeatureRecipe()})
    }
    func firstFeatureRecipe() {
        // find index of 1st featured recipe
        let index = recipeList.recipes.firstIndex { (recipe) -> Bool in
            recipe.featured
        }
        tabSelectionIndex = index ?? 0
    }
}

struct RecipeFeatureView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeatureView()
        //for the preview to work with TabView you'll need to add the
        //same enviromentObject modifier
            .environmentObject(RecipeData())
    }
}
