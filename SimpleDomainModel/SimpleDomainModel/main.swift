//
//  main.swift
//  SimpleDomainModel
//
//  Created by Ted Neward on 4/6/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import Foundation

print("Hello, World!")

public func testMe() -> String {
    return "I have been tested"
}

open class TestMe {
    open func Please() -> String {
        return "I have been tested"
    }
}

////////////////////////////////////
// Money

public struct Money {
    public var amount : Int   // in pennies
    public var currency : currencyType

    public enum currencyType {
      case USD
      case GBP
      case EUR
      case CAN
    }
    
    private func convertUSD(_ to: currencyType) -> Int {
        switch currency {
        case .USD:
            return amount
        case .GBP:
            return amount * 2
        case .EUR:
            return amount * 2 / 3
        case .CAN:
            return amount * 4 / 5
        }
    }

    public func convert(_ to: currencyType) -> Money {
      var newAmount = convertUSD(to)

      switch to {
      case .USD:
        break
      case .GBP:
        newAmount = newAmount / 2
      case .EUR:
        newAmount = newAmount * 3 / 2
      case .CAN:
        newAmount = newAmount * 5 / 4
      }

      return Money(amount: newAmount, currency: to)
    }

    public func add(_ to: Money) -> Money {
      var orig = self
      if currency != to.currency {
        orig = orig.convert(to.currency)
      }

      let newAmount = orig.amount + to.amount
      return Money(amount: newAmount, currency: currency)
    }

    public func subtract(_ from: Money) -> Money {
      var orig = self
      if currency != from.currency {
        orig = orig.convert(from.currency)
      }

      let newAmount = from.amount - orig.amount
      return Money(amount: newAmount, currency: from.currency)
    }
}

////////////////////////////////////
// Job
//
open class Job {
    static let NONE = Job(title: "(NONE)", type: .Hourly(0))
    
    fileprivate var title : String
    fileprivate var type : JobType
    
    public enum JobType {
        case Hourly(Double)
        case Salary(Int)
    }
    
    public init(title : String, type : JobType) {
        self.title = title
        self.type = type
    }
    
    open func calculateIncome(_ hours: Int) -> Int {
        switch type {
        case .Hourly(let hourNum):
            return Int(hourNum * Double(hours))
        case .Salary(let salaryNum):
            return salaryNum
        }
    }
    
    open func raise(_ amt : Double) {
        switch type {
        case .Salary(let salaryNum):
            self.type = .Salary(salaryNum + Int(amt))
        case .Hourly(let hourNum):
            self.type = .Hourly(hourNum + amt)
        }
    }
}

////////////////////////////////////
// Person

open class Person {
    static let NONE = Person(firstName: "(NONE)", lastName: "(NONE)", age: 0)
    
    open var firstName : String = ""
    open var lastName : String = ""
    open var age : Int = 0
    
    fileprivate var _job : Job? = nil
    open var job : Job? {
        get {
            if _job == nil {
                return Job.NONE
            } else {
                return _job!
            }
        }
        
        set(value) {
            if age >= 16 {
                self.job = value
            }
        }
    }
    
    fileprivate var _spouse : Person? = nil
    open var spouse : Person? {
        get {
            if _spouse == nil {
                return Person.NONE
            }
            else {
                return _spouse!
            }
        }
        
        set(value) {
            if age >= 18 {
                _spouse = value
            }
        }
    }
    
    public init(firstName : String, lastName: String, age : Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
    
    open func toString() -> String {
        return "[Person: firstName:/(firstName) lastName:/(lastName) age:/(age) job:nil spouse:nil]"
    }
}

////////////////////////////////////
// Family

//open class Family {
//    fileprivate var members : [Person] = []
//    
//    public init(spouse1: Person, spouse2: Person) {
//    }
//    
//    open func haveChild(_ child: Person) -> Bool {
//    }
//    
//    open func householdIncome() -> Int {
//    }
//}
