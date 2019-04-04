//
//  CalcError.swift
//  calc
//
//  Created by Alexander Schuessling on 03/04/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation

enum CalcError: Error {
    case invalidTermError(String)
    case notANumberError(String)
    case divisionByZero(String)
    case invalidOperator(String)
}
