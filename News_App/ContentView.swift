//
//  ContentView.swift
//  News_App
//
//  Created by Dysson Vielmann on 5/26/20.
//  Copyright © 2020 Nossyd. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model = ArticleListViewModel()
    
    var body: some View {
        ScrollView {
         
            ForEach(model.articles) {article in
                
                VStack(alignment: .leading) {
                    
                    Text(article.title)
                        .lineLimit(nil)
                        .padding(.horizontal)
                    
                    Text(article.description)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                        .padding(.horizontal)
                        .padding(.top)
                    
                    Divider()
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
