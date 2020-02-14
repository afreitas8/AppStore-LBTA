//
//  Service.swift
//  AppStore LBTA
//
//  Created by Andrew Freitas on 1/18/20.
//  Copyright © 2020 Andrew Freitas. All rights reserved.
//

import Foundation

class Service {
    
    static let shared = Service() // singleton
    
    func fetchApps(searchTerm: String, completion: @escaping(SearchResult?, Error?) -> () ) {
        print("Fetching itunes apps from service layer")
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        //let url = URL(string: urlString)
        fetchGenericJSONData(urlString: urlString, completion: completion)
        
    }
    
    func fetchTopGrossing(completion: @escaping (AppGroup?, Error?) -> ()){
        
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/25/explicit.json"
        
        fetchAppGroup(urlString: urlString, completion: completion)
        
    }
    
    func fetchGames(completion: @escaping (AppGroup?, Error?) -> ()){
        
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/50/explicit.json"
        fetchAppGroup(urlString: urlString, completion: completion)
    }
    
    //helper
    func fetchAppGroup(urlString: String, completion: @escaping (AppGroup?, Error?) -> Void){
        guard let url = URL(string: urlString) else {return}
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchSocialApps(completion: @escaping ([SocialApp]?, Error?) -> Void){
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> ()){
        guard let url = URL(string: urlString) else {return}
                
        URLSession.shared.dataTask(with: url) { (data,resp,err) in
        //  print(data)
                    
        if let err = err{
            completion(nil, err)
            return
        }
        do{
                    
            let objects = try JSONDecoder().decode(T.self, from: data!)
            //appGroup.feed.results.forEach({print($0.name)})
            completion(objects, nil)
            //print(appGroup.feed.results)
        } catch {
            completion(nil, error)
            print("Failed to decode:", error)
        }
                    
        }.resume()
    }
}
