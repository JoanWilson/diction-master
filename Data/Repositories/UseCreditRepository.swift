//
//  CreditsRepository.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 07/02/24.
//

import Domain

public protocol UseCreditRepository {
    func saveUserCredit(_ userCredit: UserCredit)
    func loadUserCredit() -> UserCredit?
    func updateUserCredit(_ userCredit: UserCredit)
}
