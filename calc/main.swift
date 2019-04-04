//
//  main.swift
//  calc
//
//  Created by Alexander Schuessling on 29/3/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation

/*
 The following program represents a calculator which is able to handle 5 different operators.
 To add an additional operator only the getPriority() method (with a specific priority for the operator)
 and the operate method (with a specific logic for the operation) have to be altered in the file Operator
 */

//main
var args = ProcessInfo.processInfo.arguments
args.removeFirst()

do {
    try checkValidity(args)
    let result: Int = try executeCalc(args, 0)
    print("\(result)")
}
catch CalcError.invalidTermError(let errorMessage) {
    print("InvalidTermError: \(errorMessage)")
    exit(1)
}
catch CalcError.notANumberError(let errorMessage) {
    print("NotANumberError: \(errorMessage)")
    exit(2)
}
catch CalcError.divisionByZero(let errorMessage) {
    print("DivisionByZero: \(errorMessage)")
    exit(3)
}
catch CalcError.invalidOperator(let errorMessage) {
    print("InvalidOperator: \(errorMessage)")
    exit(4)
}

