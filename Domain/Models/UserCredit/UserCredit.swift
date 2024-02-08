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
        let nextDayStart = calendar.date(
            bySettingHour: 0,
            minute: 0,
            second: 0,
            of: dayTime.addingTimeInterval(24*60*60)
        )!
        
        if now >= nextDayStart {
            self.dayTime = now
            self.credits = 5
            return true
        }
        
        return false
    }
}
