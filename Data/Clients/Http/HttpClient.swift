//
//  HttpClient.swift
//  Data
//
//  Created by Joan Wilson Oliveira on 07/02/24.
//

import Foundation

public protocol HttpClient {
    func decodeData<T: Codable>(type: T.Type, from data: Data) throws -> T
    func getRequest(_ request: URLRequest) async throws -> (Data, HTTPURLResponse)
}
