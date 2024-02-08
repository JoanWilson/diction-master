//
//  View+.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 08/02/24.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        window?.endEditing(true)
    }
}
