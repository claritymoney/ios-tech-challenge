//
//  Transaction.swift
//  TechChallenge
//
//  Created by Zeeshan Mian on 4/24/18.
//  Copyright © 2018 Marcus. All rights reserved.
//

import UIKit

struct Transaction {
    var id: String
    var name: String
    var category: String
    var amount: Double
    var date: Date
    var accountName: String
    var logoUrl: String?
    var isRecurring: Bool
}
