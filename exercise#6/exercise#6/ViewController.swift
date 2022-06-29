//
//  ViewController.swift
//  exercise#6
//
//  Created by Andrey Gumen on 22.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    static let notificationName = "MyMessage";

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(test),
            name: NSNotification.Name(ViewController.notificationName),
            object: nil
        )
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name(ViewController.notificationName), object: nil, queue: OperationQueue.main) { notification in
            print("test 2")
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(ViewController.notificationName), object: nil)
    }
    
    @objc
    func test() {
        print("test")
    }

}

