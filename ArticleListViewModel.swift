//
//  ArticleListViewModel.swift
//  News_App
//
//  Created by Dysson Vielmann on 5/26/20.
//  Copyright © 2020 Nossyd. All rights reserved.
//

import Foundation

final class ArticleListViewModel: ObservableObject {

    init() {
        fetchTopHeadlines()
    }
    
    // assign to articles property
    @Published var articles = [ArticleViewModel]()
    
    // make a webservice request to retreive all the news articles
    private func fetchTopHeadlines() {
        
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=57c05e0ed96f422eb7659716ddda5057") else {
            fatalError("Url is not correct.")
        }
        
        Webservice().loadTopHeadlines(url: url) { articles in
            
            if let articles = articles {
                self.articles = articles.map(ArticleViewModel.init)
            }
        }
    }
}
