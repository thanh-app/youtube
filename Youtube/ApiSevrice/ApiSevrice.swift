//
//  ApiSevrice.swift
//  Youtube
//
//  Created by apple on 10/26/19.
//  Copyright © 2019 thanh. All rights reserved.
//

import UIKit

class ApiService: NSObject {
    static let sharedInstance = ApiService()
    
    let baseUrl = "https://s3-us-west-2.amazonaws.com/youtubeassets"
    
    func fetchVideos(completion: @escaping ([Video]) -> ()) {
        fetchFeedForUrlString(urlString: "\(baseUrl)/home.json", completion: completion)
    }
    
    func fetchTrendingFeed(completion: @escaping ([Video]) -> ()) {
        fetchFeedForUrlString(urlString: "\(baseUrl)/trending.json", completion: completion)
    }
    
    func fetchSubscriprionFeed(completion: @escaping ([Video]) -> ()) {
        fetchFeedForUrlString(urlString: "\(baseUrl)/subscriptions.json", completion: completion)
    }
}

func fetchFeedForUrlString(urlString: String, completion: @escaping ([Video]) -> ()) {
    let url = URL(string: urlString)
    URLSession.shared.dataTask(with: url!) { (data, responce, error) in
        
        if error != nil {
            print(error ?? "")
            return
        }
        
        do {
            guard let data = data else { return }
            let decoder = JSONDecoder()
            //thay đổi đơn giản bộ giải mã JSON : backgroundColor thành background_color
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let videos = try decoder.decode([Video].self, from: data)
            
            DispatchQueue.main.async {
                completion(videos)
            }
            
        } catch let jsonError {
            print(jsonError)
        }
    }.resume()
}

