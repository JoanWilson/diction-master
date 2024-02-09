//
//  UserCredit.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 07/02/24.
//

import Foundation

public struct UserCredit: Codable {
    public var isPaidUser: Bool
    public var dayTime: Date?
    public var credits: Int
    
    public init(isPaidUser: Bool, dayTime: Date?, credits: Int) {
        self.isPaidUser = isPaidUser
        self.dayTime = dayTime
        self.credits = credits
    }
    
    public mutating func checkAndResetDay() -> Bool {
        guard let dayTime = dayTime else {
            return false
        }
        let calendar = Calendar.current
        let now = Date()
        
        let comparisonResult = calendar.compare(now, to: dayTime, toGranularity: .day)
        
        switch comparisonResult {
        case .orderedDescending:
            self.credits = 5
            return true
        default:
            return false
        }
    }
}
