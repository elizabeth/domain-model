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
//
public struct Money {
  public var amount : Int   // in pennies
  public var currency : curren
  
  public enum curren {
    case USD
    case GBP
    case EUR
    case CAN
  }
  
  public func convert(_ to: curren) -> Money {
    var newAmount : Int
    var newCurrency : curren
    
    switch currency {
    case .USD:
      switch to {
      case .GBP:
        newAmount = Int((Double(amount) * 0.5) * 100)
        newCurrency = .GBP
      case .EUR:
        newAmount = Int((Double(amount) * 1.5) * 100)
        newCurrency = .EUR
      case .CAN:
        newAmount = Int((Double(amount) * 1.25) * 100)
        newCurrency = .CAN
      default:
        break
      }
        
    case .GBP:
      switch to {
      case .USD:
        newAmount = Int((Double(amount) * 2) * 100)
        newCurrency = .USD
      case .EUR:
        newAmount =
        newCurrency = .EUR
      case .CAN:
        newAmount =
        newCurrency = .CAN
      default:
        break
      }
        
    case .EUR:
      switch to {
      case .USD:
        newAmount = Int((Double(amount) * (2/3)) * 100)
        newCurrency = .USD
      case .GBP:
        newAmount =
        newCurrency = .GBP
      case .CAN:
        newAmount =
        newCurrency = .CAN
      default:
        break
      }
        
    case .CAN:
      switch to {
      case .USD:
        newAmount = Int((Double(amount) * 0.8) * 100)
        newCurrency = .USD
      case .GBP:
        newAmount =
        newCurrency = .GBP
      case .EUR:
        newAmount =
        newCurrency = .EUR
      default:
        break
      }
        
    default:
      break
    }
    
    return Money(amount: amount, currency: newCurrency)
  
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
      return Int((hourNum * Double(hours)) * 100)
    }
    case .Salary(let salaryNum): {
      return salaryNum
    }
  }
  
  open func raise(_ amt : Double) {
    
  }
}

////////////////////////////////////
// Person
//
open class Person {
  static let NONE = Person(firstName: "(NONE)", lastName: "(NONE)", age: 0)

  open var firstName : String = ""
  open var lastName : String = ""
  open var age : Int = 0

  fileprivate var _job : Job? = nil
  open var job : Job? {
    get {
      if _job == nil {
          return job.NONE
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
  }
}

////////////////////////////////////
// Family
//
open class Family {
  fileprivate var members : [Person] = []
  
  public init(spouse1: Person, spouse2: Person) {
  }
  
  open func haveChild(_ child: Person) -> Bool {
  }
  
  open func householdIncome() -> Int {
  }
}
