//
//  MainTabView.swift
//  Cookcademy
//
//  Created by Hamza Khan on 2024-04-05.
//

import SwiftUI

struct MainTabView: View {
    @StateObject var recipeData = RecipeData()
    
    var body: some View {
        TabView {
            RecipeCategoryGridView()
                .tabItem { Label("Recipes", systemImage: "list.dash") }
            NavigationView {
                RecipesListView(viewStyle: .favorites)
            }.tabItem { Label("Favorite", systemImage: "heart.fill") }
            SettingsView()
                .tabItem { Label("Setting", systemImage: "gear") }
        }
        .environmentObject(recipeData)
        .onAppear {
            recipeData.loadRecipes()
        }
        
    }

}

#Preview {
    MainTabView()
}
