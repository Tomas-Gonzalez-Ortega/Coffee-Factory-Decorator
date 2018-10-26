//
//  Coffee.swift
//  Coffee
// Since Coffee is a PROTOCOL I NEED TO MAKE SURE WE HAVE ALL THESE FUNCTIONS
//  Created by Tom Nuss on 2018-02-07.
//  Copyright © 2018 Tom Nuss. All rights reserved.
//

import Foundation

protocol Coffee {
    func cost()->Double
    func ingredients()->String
}

class DarkRoast : Coffee {
    func cost()->Double {
        return 1.0
    }
    func ingredients() -> String {
        return "dark roast coffee"
    }
}

// DECORATIONS
class CoffeeAddOn : Coffee {
    private let myCup: Coffee
    required init (_ coffee: Coffee) {
        myCup = coffee
    }
    func cost() -> Double {
        return myCup.cost()
    }
    func ingredients() -> String {
        return myCup.ingredients()
    }
}

// Milk extends CoffeeAddOn Basically More Decorations
class Milk : CoffeeAddOn {
    required init(_ coffee: Coffee) {
        super.init(coffee)
    }
    override func cost() -> Double {
        return super.cost() + 2.5
    }
    override func ingredients() -> String {
         return "milky " + super.ingredients()
    }
}

class WhipCream : CoffeeAddOn {
    required init(_ coffee: Coffee) {
        super.init(coffee)
    }
    override func ingredients() -> String {
        return "Whipcream on a " + super.ingredients()
        }
}

/*
 let myLatte = WhipCream(Milk(DarkRoast()))
 myLatte.cost()
 myLatte.ingredients()
 // or Milk(WhipCream(DarkRoast())) */
