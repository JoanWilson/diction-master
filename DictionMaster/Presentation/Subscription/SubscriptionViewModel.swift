//
//  PurchaseViewModel.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 09/02/24.
//

import Foundation
import Domain

extension SubscriptionView {
    internal final class ViewModel: ObservableObject {
        private let useCase: ResetUserCreditUseCase
        
        init(useCase: ResetUserCreditUseCase) {
            self.useCase = useCase
        }
        
        func resetUserCredit() {
            useCase.resetUserCredit()
        }
    }
}
