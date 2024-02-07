//
//  HttpGetClient.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 06/02/24.
//

import Foundation

protocol HttpGetClient {
    func getRequest(_ request: URLRequest) async throws -> (Data, HTTPURLResponse)
}
