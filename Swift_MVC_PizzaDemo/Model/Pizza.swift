//
//  Pizza.swift
//  Swift_MVC_PizzaDemo
//
//  Created by Frank Cipolla on 12/12/16.
//  Copyright © 2016 Frank Cipolla. All rights reserved.
//

import UIKit

// Mark : Protocols

protocol PizzaDelegate {
    // protocol for the display update
    func displayPizza()
}

class Pizza {
    
        // Mark: Properties
    
    var delegate: PizzaDelegate? = nil
    
    // in section 5 we make some of the instance properties observable
    let Pi = 3.1415926
    var pizzaDiameter: Double = 0.0 {
        // make change notification
        didSet{
            delegate?.displayPizza()
        }
    }
    let maxPizza = 24.0
    var pizzaType: String = "Cheese" {
        // make change notification
        didSet{
            delegate?.displayPizza()
        }
    }
    var pizzaPricePerInSq : [String:Double] = [
        "Cheese": 0.03,
        "Sausage": 0.06,
        "Pepperoni": 0.05,
        "Veggie": 0.04
        ]{
        // make change notification
        didSet{
            delegate?.displayPizza()
            
        }
    }
    
// Mark : Computed Properties

    var radius: Double { // 1 -- computed property
    // must define getter for computed property
        get {
            return pizzaDiameter / 2.0
        }
        // in computed properties you don't need to add observer just add delegate call to set func
        set (newRadius) { // 5 -- optionally define a setter
            pizzaDiameter = newRadius * 2.0
            delegate?.displayPizza()  // instead of did set
        }
}

    var area: Double { // 10 -- computed property
        get {
            return radius * radius * Pi
        }
    }
    
// Mark : Methods
    
    func pizzaArea() -> Double {
        return radius * radius * Pi
    }
    
    func unitPrice() -> Double {
        let unitPrice = pizzaPricePerInSq[pizzaType] //2
        if (unitPrice != nil) {  // 3
            return unitPrice!
        }
        else {
            return 0.0
        }
    }
    
    func pizzaPrice() -> Double {
        return pizzaArea() * unitPrice()
    }
    
    func diameterFromString(aString:String) -> Double {
        switch aString {
        case "Personal","8\"":
            return 8.0
        case "10\"", "Small":
            return 10.0
        case "12\"":
            return 12.0
        case "16\"", "Medium":
            return 16.0
        case "18\"", "Large":
            return 18.0
        case "24\"", "Jumbo":
            return 24.0
        default:
            return 0.0
        }
    }
}
