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
  
  mutating public func convert(_ to: curren) -> Money {
    switch currency {
      case .USD:
        switch to {
          case .GBP:
            amount = Int((Double(amount) * 0.5) * 100)
            currency = .GBP
          case .EUR:
            amount = Int((Double(amount) * 1.5) * 100)
            currency = .EUR
          case .CAN:
            amount = Int((Double(amount) * 1.25) * 100)
            currency = .CAN
          default: 
            break
        }
        
      case .GBP:
        switch to {
          case .USD:
            amount = Int((Double(amount) * 2) * 100)
            currency = .USD
          case .EUR:
            amount = 
            currency = .EUR
          case .CAN:
            amount =
            currency = .CAN
          default: 
            break
        }
        
      case .EUR:
        switch to {
          case .USD:
            amount = Int((Double(amount) * (2/3)) * 100)
            currency = .USD
          case .GBP:
            amount = 
            currency = .GBP
          case .CAN:
            amount =
            currency = .CAN
          default: 
            break
        }
        
      case .CAN:
        switch to {
          case .USD:
            amount = Int((Double(amount) * 0.8) * 100)
            currency = .USD
          case .GBP:
            amount = 
            currency = .GBP
          case .EUR:
            amount =
            currency = .EUR
          default: 
            break
        }
        
      default:
        break
    }
    
    return self
  
  }
  
  public func add(_ to: Money) -> Money {
    var adding = to
    if to.currency != currency {
      var addingCurrency = adding.convert(self.currency)
    }
  }
  
  
  public func subtract(_ from: Money) -> Money {
    if from.currency != currency {
        
    }
      
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
    if type == .Hourly {
        return type*Int(hours)
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