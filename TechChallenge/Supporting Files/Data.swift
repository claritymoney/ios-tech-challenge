//
//  Data.swift
//  TechChallenge
//
//  Created by Zeeshan Mian on 4/26/18.
//  Copyright © 2018 Marcus. All rights reserved.
//

import Foundation

extension Transaction {
    static func getAll() -> [Transaction] {
        let csv = """
        identifier,name,category,amount,date,accountName,logoUrl
        1,"Time Warner",bill,183.21,"2017-12-05 00:00:00 +0000","Chase Freedom",https://static.claritymoney.com/images/logos/brands/time_warner.png
        2,"J.Crew",shopping,54.60,"2017-12-05 00:00:00 +0000","Chase Freedom",https://static.claritymoney.com/images/logos/brands/j.crew.png
        3,"Wendy's",food,12.61,"2017-12-05 00:00:00 +0000","Chase Freedom",https://static.claritymoney.com/images/logos/brands/wendys.png
        4,"Burger King",food,10.36,"2017-12-05 00:00:00 +0000","Chase Freedom",https://static.claritymoney.com/images/logos/brands/burger_king.png
        5,"Uber",travel,54.28,"2017-12-05 00:00:00 +0000","Chase Freedom",https://static.claritymoney.com/images/logos/brands/uber.png
        6,Amazon,shopping,6.51,"2017-12-05 00:00:00 +0000","Chase Freedom",https://static.claritymoney.com/images/logos/brands/amazon.jpg
        7,"Trader Joe's",food,80.65,"2017-12-05 00:00:00 +0000","Chase Freedom",https://static.claritymoney.com/images/logos/brands/trader_joe's.png
        8,CVS,health,10.52,"2017-12-05 00:00:00 +0000","Chase Freedom",https://static.claritymoney.com/images/logos/brands/cvs.png
        9,Wawa,food,15.95,"2017-12-05 00:00:00 +0000","Chase Freedom",https://static.claritymoney.com/images/logos/brands/wawa.png
        10,ExxonMobil,travel,44.22,"2017-12-05 00:00:00 +0000","Chase Freedom",https://static.claritymoney.com/images/logos/brands/exxonmobil.png
        11,Starbucks,food,7.89,"2017-12-05 00:00:00 +0000","Chase Freedom",https://static.claritymoney.com/images/logos/brands/starbucks.png
        12,"AMC Loews Lincoln Square 13",entertainment,40.99,"2017-12-05 00:00:00 +0000","Chase Freedom",<null>
        13,"American Airlines",travel,516.78,"2017-12-05 00:00:00 +0000","Chase Freedom",https://static.claritymoney.com/images/logos/brands/american_airlines.png
        """

        let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.timeZone = TimeZone(identifier: "UTC")!
            formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            return formatter
        }()

        let lines = csv.components(separatedBy: .newlines).dropFirst()

        var transactions = [Transaction]()

        for (index, line) in lines.enumerated() {
            let words = line.components(separatedBy: ",")

            var id = ""
            var name = ""
            var category = ""
            var amount = 0.0
            var date = Date()
            var accountName = ""
            var logoUrl: String?
            let isRecurring = index % 2 == 0

            for (index, var word) in words.enumerated() {
                word = word.replacingOccurrences(of: "\"", with: "")

                switch index {
                    case 0:
                        id = word
                    case 1:
                        name = word
                    case 2:
                        category = word
                    case 3:
                        amount = Double(word) ?? 0
                    case 4:
                        date = dateFormatter.date(from: word) ?? Date()
                    case 5:
                        accountName = word
                    case 6:
                        logoUrl = word == "<null>" ? nil : word
                    default:
                        break
                }
            }

            let transaction = Transaction(
                id: id,
                name: name,
                category: category,
                amount: amount,
                date: date,
                accountName: accountName,
                logoUrl: logoUrl,
                isRecurring: isRecurring
            )

            transactions.append(transaction)
        }

        return transactions
    }
}
