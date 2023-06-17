//
//  ViewController.swift
//  nids-first-ios
//
//  Created by Nidiyan Rajendran on 6/17/23.
//

import UIKit

class ViewController: UIViewController {
    let tableview: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = UIColor.green
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemRed
        view.addSubview(tableview)
        tableview.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        
    }


}

