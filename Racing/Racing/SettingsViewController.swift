//
//  RecordsViewController.swift
//  Racing
//
//  Created by Andrey Gumen on 29.06.2022.
//

import UIKit

class Parameters {
    var speed: Double = 10
    var time: Decimal = 0
    var score: Int = 0
}

final class SettingsViewController: UIViewController {
    
    var testButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let width: CGFloat = 100
        let height: CGFloat = 20
        var origin = view.center
        origin.x -= width * 0.5
        origin.y -= height * 0.5
        let size = CGSize(width: 100, height: 20)
        testButton.setTitle("Pass to game view", for: .normal)
        testButton.frame = CGRect(origin: origin, size: size)
        testButton.addTarget(self, action: #selector(testMethod), for: .touchUpInside)
        
        view.addSubview(testButton)
    }
    
    @objc
    func testMethod() {
        print("press")
        let params = Parameters()
        params.score = 1400
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let gameViewController = storyBoard.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        
        gameViewController.currentParameters = params
    }
    
}


