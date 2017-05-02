//
//  PriceVC.swift
//  Swift_MVC_PizzaDemo
//
//  Created by Frank Cipolla on 12/13/16.
//  Copyright © 2016 Frank Cipolla. All rights reserved.
//

protocol PriceDelegate {
    func priceDidFinish(controller:PriceVC,pizza:Pizza)
}

import UIKit

class PriceVC: UIViewController, PizzaDelegate{

    var pizza = Pizza()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let currentUnitPrice = pizza.pizzaPricePerInSq[pizza.pizzaType] {
            unitPriceText.text = String(
                format: "%0.2f" , currentUnitPrice
            )
        }
        displayPizza()
        
        unitPriceText.keyboardType = UIKeyboardType.decimalPad
        unitPriceText.becomeFirstResponder()
    }

    // Mark : Outlets and variables
    
    @IBOutlet weak var sizeToppinLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var unitPriceText: UITextField!
    
    
    var delegate:PriceDelegate? = nil
    
    
    // Mark : Actions
    
    @IBAction func doneEditingPrice(_ sender: UIBarButtonItem) {
        // navigationController?.popViewController(animated: true) // used this prior to setting up delegate
        delegate?.priceDidFinish(controller: self, pizza: pizza)
    }
    
    @IBAction func unitPriceText(_ sender: UITextField) {
        let unitPrice = Double(sender.text!)
        pizza.pizzaPricePerInSq[pizza.pizzaType] = unitPrice  // 4
        displayPizza()
    }
    
    // Mark : Instance Methods
    
    func displayPizza() {
        // in section 5 we rename displayText to displayPizza
        sizeToppinLabel.text = String(
            format: "%6.2f inch %@",
            pizza.pizzaDiameter,
            pizza.pizzaType
        )
        
        priceLabel.text = String(
            format: "6.2f sq in %6.3f/sq in = $%6.2f",
            pizza.area,
            pizza.unitPrice(),
            pizza.pizzaPrice()
        )
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
