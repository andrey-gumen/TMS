//
//  RecordsViewController.swift
//  Racing
//
//  Created by Andrey Gumen on 29.06.2022.
//

import UIKit

final class GameViewController: UIViewController {
    
    var scoreLabel = UILabel()
    var currentParameters: Parameters = Parameters() {
        didSet {
            print(currentParameters.score)
            repaintScreen()
        }
    }
    
    private func repaintScreen() {
        scoreLabel.text = "Total score: \(currentParameters.score)"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(scoreLabel)
        let frame = CGRect(origin: view.center, size: CGSize(width: 200, height: 200))
        scoreLabel.frame = frame
        scoreLabel.textColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        repaintScreen()
    }
    
    @IBAction
    func showMainMenu() {
        dismiss(animated: true)
    }
    
}


