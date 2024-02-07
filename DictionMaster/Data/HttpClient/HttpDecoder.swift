//
//  HttpDecoder.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 07/02/24.
//

import Foundation

protocol HttpDecoder {
    func decodeData<T: Codable>(type: T.Type, from data: Data) throws -> T 
}
