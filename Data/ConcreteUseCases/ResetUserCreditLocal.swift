//
//  ResetUserCreditLocal.swift
//  Data
//
//  Created by Joan Wilson Oliveira on 09/02/24.
//

import Domain

public final class ResetUserCreditLocal: ResetUserCreditUseCase {
    private let userCreditRepository: UseCreditRepository
    
    public init(userCreditRepository: UseCreditRepository) {
        self.userCreditRepository = userCreditRepository
    }
    
    public func resetUserCredit() {
        let userCredit = UserCredit(isPaidUser: false, dayTime: Date(), credits: 5)
        userCreditRepository.updateUserCredit(userCredit)
    }
}
