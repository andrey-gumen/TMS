//
//  ViewController.swift
//  exercise#6
//
//  Created by Andrey Gumen on 22.06.2022.
//

//3.  · По нажатию кнопки экран заполняется разноцветными квадратами с фиксированной стороной. Квадраты не пересекаются

import UIKit

class ViewController2: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let squares = ViewController2.generateSquares(in: view.bounds)
        squares.forEach {
            view.addSubview($0)
            $0.backgroundColor = ViewController1.generateColor()
        }
    }
    
    static func generateSquares(in rect: CGRect) -> [UIView] {
        let length = CGFloat.random(in: 10...100)
        let size = CGSize(width: length, height: length)
        var squares: [UIView] = []
        
        var x: CGFloat = 0
        while x < rect.maxX - length {
            var y: CGFloat = 0
            while y < rect.maxY - length {
                let point = CGPoint(x: x, y: y)
                let frame = CGRect(origin: point, size: size)
                let square = UIView(frame: frame)
                squares.append(square)
                y += length
            }
            x += length
        }
        
        return squares
    }

}

