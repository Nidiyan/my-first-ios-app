//
//  stock_api.swift
//  nids-first-ios
//
//  Created by Nidiyan Rajendran on 6/17/23.
//

import Foundation

class StockAPI {
    var api_url: URL
    
    init (api_url: URL) {
        self.api_url = api_url
    }
    
    func getData() {
        print("[StockAPIgetData] Sending Request")
        //var api_data: Dictionary<String, Any>
        
        var request = URLRequest(url: api_url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else { print(error!.localizedDescription); return }
            guard let data = data else { print("Empty data"); return }
            
            do {
                if let jsonData = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [Dictionary<String, Any>] {
                    print(jsonData)
                } else {
                    print("no")
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
}
