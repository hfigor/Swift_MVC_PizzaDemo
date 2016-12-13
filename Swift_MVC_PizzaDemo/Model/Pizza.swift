//
//  Pizza.swift
//  Swift_MVC_PizzaDemo
//
//  Created by Frank Cipolla on 12/12/16.
//  Copyright © 2016 Frank Cipolla. All rights reserved.
//

import UIKit

class Pizza {
    
    let Pi = 3.1415926
    var pizzaDiameter = 0.0
    let maxPizza = 24.0
    var pizzaType = "Cheese"
    var pizzaPricePerInSq = [
        "Cheese": 0.03,
        "Sausage": 0.06,
        "Pepperoni": 0.05,
        "Veggie": 0.04
    ]
    
// Mark : Computed Properties

    var radius: Double { // 1 -- computed property
    // must define getter for computed property
        get {
            return pizzaDiameter / 2.0
        }
        set (newRadius) { // 5 -- optionally define a setter
            pizzaDiameter = newRadius * 2.0
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
