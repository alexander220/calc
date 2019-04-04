//
//  Operations.swift
//  calc
//
//  Created by Alexander Schuessling on 03/04/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation


class Operation {
    var arg1: Int?
    var arg2: Int?
    var op: String
    
    init(_ arg1: String, _ op: String, _ arg2: String) {
        self.arg1 = Int(arg1)
        self.arg2 = Int(arg2)
        self.op = op
    }
    
    /*
     Returns the specific priority of the operator. Higher priorities are calculated first.
     */
    static func getPriority(_ op: String) -> Int {
        if op == "+" || op == "-" {
            return 1
        }
        if op == "x" || op == "/" || op == "%" {
            return 2
        }
        return 0
    }
    
    /*
     Does the actual mathematical operation
     */
    func operate() throws -> Int {
        switch op {
        case "+":
            return Int(arg1!) + Int(arg2!)
        case "-":
            return Int(arg1!) - Int(arg2!)
        case "x":
            return Int(arg1!) * Int(arg2!)
        case "/":
            if Int(arg2!) == 0 {
                throw CalcError.divisionByZero("Divison by zero!")
            }
            return Int(arg1!) / Int(arg2!)
        case "%":
            return Int(arg1!) % Int(arg2!)
        default:
            if Int(op) != nil {
                throw CalcError.invalidOperator("\(op) is a number, not an operator")
            }
            else {
                throw CalcError.invalidOperator("The operator \(op) is not defined")
            }
        }
    }
    
}
