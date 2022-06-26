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
    
    enum OffsetType {
        case Left, Right, Up, Down
        
        func getOffset() -> CGPoint {
            let offset: CGFloat = 20
            switch self {
            case .Up:
                return CGPoint(x: 0, y: -offset)
            case .Down:
                return CGPoint(x: 0, y: offset)
            case .Left:
                return CGPoint(x: -offset, y: 0)
            case .Right:
                return CGPoint(x: offset, y: 0)
            }
        }
    }
    
    func moveCircle(to: OffsetType) {
        let offset = to.getOffset()
        moveCircle(to: offset)
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
        let size: CGFloat = 60
        circle.bounds.size = CGSize(width: size, height: size)
        circle.layer.cornerRadius = size / 2
        circle.backgroundColor = .red
        view.addSubview(circle)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        circle.center = view.center
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

