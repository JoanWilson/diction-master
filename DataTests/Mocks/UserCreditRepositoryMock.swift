//
//  UserCreditRepositoryMock.swift
//  DataTests
//
//  Created by Joan Wilson Oliveira on 08/02/24.
//

import Domain
import Data

class UserCreditRepositoryMock: UseCreditRepository {
    var userCredit: UserCredit!
    
    func saveUserCredit(_ userCredit: UserCredit) {
        self.userCredit = userCredit
    }
    
    func loadUserCredit() -> UserCredit? {
        return userCredit
    }
    
    func updateUserCredit(_ userCredit: UserCredit) {
        self.userCredit = userCredit
    }
}
