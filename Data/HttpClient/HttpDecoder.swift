//
//  HttpDecoder.swift
//  Data
//
//  Created by Joan Wilson Oliveira on 07/02/24.
//

import Foundation

public protocol HttpDecoder {
    func decodeData<T: Codable>(type: T.Type, from data: Data) throws -> T
}
