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
    
    func getData(completion: @escaping (_ data: Any?, _ error: Error?) -> Void) {
        print("[StockAPIgetData] Sending Request")
        let task = URLSession.shared.dataTask(with: api_url, completionHandler: { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            do {
                if let data = data {
                    let json = try JSONSerialization.jsonObject(with: data, options: [.allowFragments])
                    completion(json, nil)
                } else {
                    completion(nil, nil)
                }
            } catch {
                completion(nil, error)
            }
        })
        
        task.resume()
    }
    
}
