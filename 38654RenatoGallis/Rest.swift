//
//  Rest.swift
//  38654RenatoGallis
//
//  Created by user132786 on 11/26/17.
//  Copyright © 2017 user132786. All rights reserved.
//


import Foundation
import UIKit

class REST {
    
    static let basePath = "https://api.punkapi.com/v2/beers/"
    
    static let configuration: URLSessionConfiguration = {
        
        let config = URLSessionConfiguration.default
        config.allowsCellularAccess = true
        config.timeoutIntervalForRequest = 45.0
        config.httpMaximumConnectionsPerHost = 5
        config.httpAdditionalHeaders = ["Content-Type": "application/json"]
        
        
        return config
    }()
    
    static let session = URLSession(configuration: configuration)
    
    static func loadCars(onComplete: @escaping ([Beers]?) -> Void) {
        
        guard let url = URL(string: basePath) else {
            onComplete(nil)
            return
        }
        
        let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if error != nil {
                print("Deu ruim!!!")
                onComplete(nil)
            } else {
                guard let response = response as? HTTPURLResponse else {
                    onComplete(nil)
                    return
                }
                if response.statusCode == 200 {
                    guard let data = data else {
                        onComplete(nil)
                        return
                    }
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as! [[String: Any]]
                        
                        var beers: [Beers] = []
                        for item in json {
                            let id = item["id"] as! Int
                            let name = item["name"] as! String
                            let imageURL = item["image_url"] as! String
                            let abv = item["abv"] as! Double
                            let description = item["description"] as! String
                            let tagline = item["tagline"] as! String
                            var ibu = nullToNil(value: item["ibu"] as AnyObject)
                            
                            
                            if ibu == nil{
                                ibu = 0.0 as AnyObject
                            }
                            
                            let beer = Beers( name: name, tagline: tagline,imageURL: imageURL,abv: abv, ibu: ibu as! Double, description: description)
                            beer.id = id
                            
                            beers.append(beer)
                        }
                        onComplete(beers)
                    } catch {
                        print(error.localizedDescription)
                        onComplete(nil)
                    }
                } else {
                    print("Erro no servidor:", response.statusCode)
                    onComplete(nil)
                }
            }
        }
        
        dataTask.resume()
        print("FIM")
    }
    
    static func nullToNil(value : AnyObject?) -> AnyObject? {
        if value is NSNull {
            return nil
        } else {
            return value
        }
    }
    
    static func downloadImage(url: String, onComplete: @escaping (UIImage?) -> Void) {
        
        guard let url = URL(string: url) else {
            onComplete(nil)
            return
        }
        
        session.downloadTask(with: url) { (imageURL: URL?, response: URLResponse?, error: Error?) in
            
            if let response = response as? HTTPURLResponse, response.statusCode == 200, let imageURL = imageURL {
                
                let imageData = try! Data(contentsOf: imageURL)
                let image = UIImage(data: imageData)
                onComplete(image)
                
            } else {
                onComplete(nil)
            }
            
            }.resume()
        
    }
    
    
}
