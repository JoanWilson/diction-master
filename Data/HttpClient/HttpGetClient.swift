//
//  HttpGetClient.swift
//  Data
//
//  Created by Joan Wilson Oliveira on 07/02/24.
//

import Foundation

public protocol HttpGetClient {
    func getRequest(_ request: URLRequest) async throws -> (Data, HTTPURLResponse)
}
