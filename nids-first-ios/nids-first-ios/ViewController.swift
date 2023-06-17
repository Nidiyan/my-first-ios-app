//
//  ViewController.swift
//  nids-first-ios
//
//  Created by Nidiyan Rajendran on 6/17/23.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    @State var api_data = ""
    
    let tableview: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = UIColor.green
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.backgroundColor = .systemRed
        button.setTitle("Get API Data", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

         self.view.addSubview(button)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        print("[Main] Button clicked, getting API data")
        
        let stocks = StockAPI(api_url: constants.urls.stock_api_url!)
        
        stocks.getData(completion: { [weak self] (result, error) in
                    if let error = error {
                        print(error.localizedDescription)
                    }
                    if let result = result {
                        print(result)
                    }
                })
    }


}

