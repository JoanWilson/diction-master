//
//  MockURLProtocol.swift
//  InfrastructureTests
//
//  Created by Joan Wilson Oliveira on 03/03/24.
//

import Foundation

class MockURLProtocol: URLProtocol {
    static var stub: [URLRequest: (Data, HTTPURLResponse)] = [:]

    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    override func startLoading() {
        guard request.url != nil,
              let (data, response) = MockURLProtocol.stub[request] else {
            client?.urlProtocol(self, didFailWithError: URLError(.badURL))
            return
        }

        client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
        client?.urlProtocol(self, didLoad: data)
        client?.urlProtocolDidFinishLoading(self)
    }

    override func stopLoading() { }
}
