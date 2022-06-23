//
//  ViewController.swift
//  exercise#6
//
//  Created by Andrey Gumen on 22.06.2022.
//

//2.  · Игрушка для котиков - появление разноцветного кружочка, по тапу исчезает ( либо isHidden || removeFromSuperview) и появляется в новом месте ( кодом )

import UIKit

class ViewController1: UIViewController {
    
    private let circle = UIButton()
    private let diametr: CGFloat = 100

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(circle)
        circle.addTarget(self, action: #selector(pressed(_ :)), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        circle.bounds.size = CGSize(width: diametr, height: diametr)
        circle.center = view.center
        circle.layer.cornerRadius = diametr / 2
        circle.backgroundColor = ViewController1.generateColor()
        circle.isHidden = false
    }
    
    @objc func pressed(_ sender: UIButton) {
        circle.isHidden = true
        let seconds: Double = 1
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) { [self] in
            let previousFrame = circle.frame
            repeat {
                circle.center = ViewController1.generatePoint(in: view.bounds)
            } while previousFrame.intersects(circle.frame)
                    
            circle.backgroundColor = ViewController1.generateColor()
            circle.isHidden = false
        }
    }
    
    static func generatePoint(in rect: CGRect) -> CGPoint {
        let x = CGFloat.random(in: rect.minX...rect.maxX)
        let y = CGFloat.random(in: rect.minY...rect.maxY)
        return CGPoint(x: x, y: y)
    }
    
    static func generateColor() -> UIColor {
        switch Int.random(in: 1...4) {
        case 1: return UIColor.yellow
        case 2: return UIColor.red
        case 3: return UIColor.green
        case 4: return UIColor.brown
        default: return UIColor.cyan
        }
    }

}

