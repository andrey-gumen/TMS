//
//  ViewController.swift
//  BeerBar
//
//  Created by Andrey Gumen on 19.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var infoBeer1: UILabel!
    @IBOutlet weak var revenueBeer1: UILabel!
    @IBOutlet weak var infoBeer2: UILabel!
    @IBOutlet weak var revenueBeer2: UILabel!
    
    @IBOutlet weak var totalRevenue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        BeerManager.instance.reserve = [
            Beer(name: "Kozel", price: 140 * 1000 / 300, country: "Czech Republic", volume: 40),
            Beer(name: "Pilsener", price: 210 * 1000 / 300, country: "Germany", volume: 40)
        ]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        repaint()
    }
    
    func repaint() {
        let beer1 = BeerManager.instance.reserve[0]
        infoBeer1.text = "\(beer1.name) / \(format(cents: beer1.price * 0.3))$ / \(format(lt: beer1.availableVolume))lt"
        let beer1Revenue = revenue(of: beer1)
        revenueBeer1.text = "\(format(cents: beer1Revenue))"
        
        let beer2 = BeerManager.instance.reserve[1]
        infoBeer2.text = "\(beer2.name) / \(format(cents: beer2.price * 0.3))$ / \(format(lt: beer2.availableVolume))lt"
        let beer2Revenue = revenue(of: beer2)
        revenueBeer2.text = "\(format(cents: beer2Revenue))"
        
        totalRevenue.text = "\(format(cents: beer1Revenue + beer2Revenue))"
    }
    
    func revenue(of beer: Beer) -> Double {
        (beer.incomingVolume - beer.availableVolume) * beer.price
    }
    
    func format(cents: Double) -> String {
        String(format: "%.2f", cents * 0.01)
    }
    
    func format(lt: Double) -> String {
        String(format: "%.2f", lt)
    }
    
    @IBAction func sellBeer1(_ sender: Any) {
        let beer = BeerManager.instance.reserve[0]
        BeerManager.instance.sell(beer)
        repaint()
    }
    
    @IBAction func sellBeer2(_ sender: Any) {
        let beer = BeerManager.instance.reserve[1]
        BeerManager.instance.sell(beer)
        repaint()
    }
    
    @IBAction func checkRevenue(_ sender: Any) {
        let isOk = BeerManager.instance.checkRevenue()
        print(isOk ? "all is good" : "deficit or surplus")
    }
    
    @IBAction func newShift(_ sender: Any) {
        BeerManager.instance.newShift()
        repaint()
    }
    
}

