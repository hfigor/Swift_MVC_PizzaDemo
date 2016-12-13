//
//  ViewController.swift
//  Swift_MVC_PizzaDemo
//
//  Created by Frank Cipolla on 12/12/16.
//  Copyright © 2016 Frank Cipolla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let pizza = Pizza() // 1 instantiate Pizza object
    let clearString = "I like Pizza!" // 2 instance string constant

    override func viewDidLoad() {
        super.viewDidLoad()
        resultsDisplayLabel.text = clearString
        view.backgroundColor = UIColor( //UIColor( red: 0.99, green: 0.9, blue: 0.9, alpha: 1.0 )
            red: 0.99,
            green: 0.9,
            blue: 0.9,
            alpha: 1.0
        )
   
    }
    
// Mark : Outlets
    
    @IBOutlet weak var resultsDisplayLabel: UILabel!
    
// Mark : Actions
    
    @IBAction func pizzaType(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        pizza.pizzaType = sender.titleForSegment(at: index)!
        displayPizza()
    }
    
    
    @IBAction func sizeButton(_ sender: UIButton) {  // Blue Button
        pizza.pizzaDiameter = pizza.diameterFromString(aString: sender.titleLabel!.text!) // watch for optionals
        displayPizza()
    }
    
    
    @IBAction func clearDisplayButton(_ sender: UIButton) {  // Red Button
        resultsDisplayLabel.text = clearString
        
    }
    
    
// Mark: Instance Methods
    
    func displayPizza() {
        let displayString  = String(
            format: "%6.1f inch %@ $ %6.2f",
            pizza.pizzaDiameter,
            pizza.pizzaType,
            pizza.pizzaPrice()
        ) // 2 using dot notation
        resultsDisplayLabel.text = displayString
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
