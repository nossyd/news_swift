//
//  ArticleViewModel.swift
//  News_App
//
//  Created by Dysson Vielmann on 5/26/20.
//  Copyright © 2020 Nossyd. All rights reserved.
//

import Foundation

class ArticleViewModel: Identifiable {
    
    let id = UUID()
    let article : Article
    
    init(article: Article) {
        self.article = article
    }
    
    var title: String {
        return self.article.title
    }
    
    var description: String {
        return self.article.description ?? ""
    }
}

