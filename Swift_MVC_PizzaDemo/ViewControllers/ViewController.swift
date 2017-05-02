//
//  ViewController.swift
//  Swift_MVC_PizzaDemo
//
//  Created by Frank Cipolla on 12/12/16.
//  Copyright © 2016 Frank Cipolla. All rights reserved.
//

import UIKit

class ViewController: UIViewController, PriceDelegate, PizzaDelegate{
    
    // MARK: Properties
    
    var pizza: Pizza = Pizza() { // 1 instantiate Pizza object
        didSet {
            // any change to the class but not properties
            displayPizza()
        }
    }
    let clearString = "I like Pizza!" // 2 instance string constant
    
    // MARK: The View
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pizza.delegate = self // connect the pizza delegate
        resultsDisplayLabel.text = clearString
        view.backgroundColor = UIColor( //UIColor( red: 0.99, green: 0.9, blue: 0.9, alpha: 1.0 )
            red: 0.99,
            green: 0.9,
            blue: 0.9,
            alpha: 1.0
        )
        
    }
    
    // MARK: Outlets
    
    @IBOutlet weak var resultsDisplayLabel: UILabel!
    
    @IBOutlet weak var pizzaType: UISegmentedControl!
    
    
    // MARK: Actions
    
    @IBAction func pizzaType(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        pizza.pizzaType = sender.titleForSegment(at: index)!
        // displayPizza() we now have a delegate
    }
    
    
    @IBAction func sizeButton(_ sender: UIButton) {  // Blue Button
        pizza.pizzaDiameter = pizza.diameterFromString(aString: sender.titleLabel!.text!) // watch for optionals
        //displayPizza() we now have a delegate
    }
    
    
    @IBAction func clearDisplayButton(_ sender: UIButton) {  // Red Button
        pizza.delegate = nil // shut down delegate
        resultsDisplayLabel.text = clearString
        // add default pizza settings in section 5 ( I think this should be handled with a pizza.init Frank
        pizza.pizzaDiameter = 0.0
        pizza.pizzaType = "Cheese"
        pizzaType.selectedSegmentIndex = 0 // reset to first segment
        pizza.delegate = self // turn delegate back on
    }
    
    // MARK:  Delegates and Protocols
    
    func priceDidFinish(controller: PriceVC, pizza: Pizza) {
        self.pizza = pizza // 2 we assign the data from the returning controller to our local var.
        controller.navigationController?.popViewController(animated: true) // 3 dismiss the PriceVC
        // displayPizza()  in section 5 we are now opserving the Pizza() so this is not needed
    }
    
    // MARK: Instance Methods
    
    func displayPizza() {
        let displayString  = String(
            format: "%6.1f inch %@ $ %6.2f",
            pizza.pizzaDiameter,
            pizza.pizzaType,
            pizza.pizzaPrice()
        ) // 2 using dot notation
        resultsDisplayLabel.text = displayString
    }
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "type price" {
            let vc = segue.destination as! PriceVC
            vc.pizza = self.pizza
            vc.delegate = self
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

