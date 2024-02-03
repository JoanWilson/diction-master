//
//  RemoteGetWordDefinition.swift
//  Data
//
//  Created by Joan Wilson Oliveira on 03/02/24.
//

import Foundation

public final class RemoteGetWordDefiniton {
    private let url: URL
    private let httpClient: HttpGetClient
    
    public init(url: URL, httpClient: HttpGetClient) {
        self.url = url
        self.httpClient = httpClient
    }
    
    public func get() {
        httpClient.get(url: url)
    }
}
