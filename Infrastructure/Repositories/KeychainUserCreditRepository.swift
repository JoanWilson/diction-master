//
//  KeychainSecureRepository.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 07/02/24.
//

import Domain
import Data
import Security

public final class KeychainUserCreditRepository: UseCreditRepository {
    private let serviceName = "com.yourapp.usercredit"
    private let accountName = "UserCredit"

    public init() {}
    
    public func saveUserCredit(_ userCredit: UserCredit) {
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(userCredit) {
            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: accountName,
                kSecAttrService as String: serviceName,
                kSecValueData as String: encodedData
            ]
            
            let status = SecItemAdd(query as CFDictionary, nil)
            if status != errSecSuccess && status != errSecDuplicateItem {
                print("Error saving user credit to keychain: \(status)")
            }
        }
    }
    
    public func loadUserCredit() -> UserCredit? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: accountName,
            kSecAttrService as String: serviceName,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var dataTypeRef: AnyObject?
        let status: OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        
        if status == errSecSuccess, let retrievedData = dataTypeRef as? Data {
            let decoder = JSONDecoder()
            if let userCredit = try? decoder.decode(UserCredit.self, from: retrievedData) {
                return userCredit
            }
        }
        return nil
    }
    
    public func updateUserCredit(_ userCredit: UserCredit) {
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(userCredit) {
            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: accountName,
                kSecAttrService as String: serviceName
            ]
            
            let attributes: [String: Any] = [
                kSecValueData as String: encodedData
            ]
            
            let status = SecItemUpdate(query as CFDictionary, attributes as CFDictionary)
            if status != errSecSuccess {
                print("Error updating user credit in keychain: \(status)")
            }
        }
    }
}
