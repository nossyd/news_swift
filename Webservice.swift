//
//  Webservice.swift
//  News_App
//
//  Created by Dysson Vielmann on 5/26/20.
//  Copyright © 2020 Nossyd. All rights reserved.
//

import Foundation

struct NewsResponse: Codable {
    let articles : [Article]
}

struct Article : Codable {
    let title : String
    let description : String?
}

class Webservice {
    
    // retrieves all the articles and populates Article model
    func loadTopHeadlines(url: URL, completion : @escaping ([Article]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let response = try? JSONDecoder().decode(NewsResponse.self, from: data)
            
            if let response = response {
                DispatchQueue.main.async {
                    completion(response.articles)
                }
            }
        }.resume()
    }
}
