//
//  SubViewController.swift
//  BeerBar
//
//  Created by Andrey Gumen on 20.06.2022.
//

import UIKit

class SubViewController: UIViewController {
    
    let view1 = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        view.addSubview(view1)
        view1.backgroundColor = .blue
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view1.frame = CGRect(x: 100, y: 200, width: 200, height: 100)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view1.frame = CGRect(x: 100, y: 200, width: 200, height: 200)
    }
    
}




