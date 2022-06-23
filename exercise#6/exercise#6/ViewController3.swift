//
//  ViewController.swift
//  exercise#6
//
//  Created by Andrey Gumen on 22.06.2022.
//

//4.  · На экране кружок по центру . Четыре кнопки - вверх , вниз , вправо , влево . При нажатии кнопки кружок перемещается на фиксированное расстояние . За края экрана не выходит , на  кнопки не налезает.

import UIKit

class ViewController3: UIViewController {
    
    @IBOutlet weak var upButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var downButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    private let circle = UIView()
    
    private let offset: CGFloat = 20
    enum OffsetType {
        case Left
        case Right
        case Up
        case Down
    }
    
    func moveCircle(to: OffsetType) {
        switch to {
        case .Left: moveCircle(to: CGPoint(x: -offset, y: 0));
        case .Right: moveCircle(to: CGPoint(x: offset, y: 0));
        case .Up: moveCircle(to: CGPoint(x: 0, y: -offset));
        case .Down: moveCircle(to: CGPoint(x: 0, y: offset));
        }
    }
    
    func moveCircle(to offset: CGPoint) {
        var predictedFrame = circle.frame
        predictedFrame.origin.x += offset.x
        predictedFrame.origin.y += offset.y
        
        guard view.bounds.contains(predictedFrame) else { return }
        
        let anyButtonItersected = upButton.frame.intersects(predictedFrame) ||
            downButton.frame.intersects(predictedFrame) ||
            leftButton.frame.intersects(predictedFrame) ||
            rightButton.frame.intersects(predictedFrame)
        
        if !anyButtonItersected {
            circle.frame = predictedFrame
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(circle)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        circle.center = view.center
        let size: CGFloat = 60
        circle.bounds.size = CGSize(width: size, height: size)
        circle.layer.cornerRadius = size / 2
        circle.backgroundColor = .red
    }

    @IBAction func upHandler(_ sender: Any) {
        moveCircle(to: .Up)
    }
    @IBAction func downHandler(_ sender: Any) {
        moveCircle(to: .Down)
    }
    @IBAction func leftHandler(_ sender: Any) {
        moveCircle(to: .Left)
    }
    @IBAction func rightHandler(_ sender: Any) {
        moveCircle(to: .Right)
    }
}

