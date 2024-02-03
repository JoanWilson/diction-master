//
//  File.swift
//  Data
//
//  Created by Joan Wilson Oliveira on 03/02/24.
//

import Foundation

public protocol HttpGetClient {
    func get(url: URL)
}
