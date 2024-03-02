//
//  View+.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 08/02/24.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
