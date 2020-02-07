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
    
    func fetchApps(searchTerm: String, completion: @escaping([Result], Error?) -> () ) {
        print("Fetching itunes apps from service layer")
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        //let url = URL(string: urlString)
        
        guard let url = URL(string:urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            if let err = err {
                print("Failed to fetch apps", err)
                completion([], nil)
                return
            }
            guard let data = data else {
                    return
            }
        
            do{
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                searchResult.results.forEach({print($0.trackName,$0.primaryGenreName)})
                
                completion(searchResult.results, nil)
                
            }  catch {
                //while using a do catch, if an error is encountered it is defined as error and is made abstractly
                print("Failed to decode json", error)
                completion([], error)
            }
        
        }.resume()
    }
    
    func fetchGames(completion: @escaping (AppGroup?, Error?) -> ()){
        guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/50/explicit.json") else{
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data,resp,err) in
//            print(data)
            
            if let err = err{
                completion(nil, err)
                return
            }
            do{
                let appGroup = try JSONDecoder().decode(AppGroup.self, from: data!)
                appGroup.feed.results.forEach({print($0.name)})
                completion(appGroup, nil)
                //print(appGroup.feed.results)
            } catch {
                completion(nil, error)
                print("Failed to decode:", error)
            }
            
        }.resume()
    }
}
