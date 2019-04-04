//
//  CalcHelper.swift
//  calc
//
//  Created by Alexander Schüßling on 04.04.19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation

/*
 Checks the Validity of the entered term, regarding number of arguments and if every operand that should be
 a number, is actually a number
 */
func checkValidity(_ term: [String]) throws {
    if term.count % 2 == 0 {
        throw CalcError.invalidTermError("The term you entered is not correct, it is not complete")
    }
    for i in 0 ... term.count - 1 {
        if i % 2 == 0 {
            if Int(term[0]) ==  nil {
                throw CalcError.notANumberError("The term is not valid. \(term[i]) is not a number")
            }
        }
    }
    if Int(term[term.count - 1]) == nil {
        throw CalcError.notANumberError("The term is not valid. \(term[term.count - 1]) is not a number")
    }
}

/*
 Iterates recursively over the term, calls the operateMethod and updates the term array. Additionally
 it removes all arguments, that have already been used
 */
func executeCalc(_ term: [String], _ position: Int) throws -> Int {
    var termNew: [String] = term
    if term.count == 1 {
        return Int(term[0])!
    }
    if termNew.count <= 3 || position + 3 >= termNew.count || Operation.getPriority(termNew[position + 1]) >= Operation.getPriority(term[position + 3]) {
        termNew[position] = String(try Operation(termNew[position], termNew[position + 1], termNew[position + 2]).operate())
        if position + 2 < termNew.count {
            termNew.remove(at: position + 1)
            termNew.remove(at: position + 1)
        }
    }
    else {
        return try executeCalc(termNew, position + 2)
    }
    return try executeCalc(termNew, 0)
}
