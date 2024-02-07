//
//  CacheStorage.swift
//  Data
//
//  Created by Joan Wilson Oliveira on 07/02/24.
//

import Foundation

public protocol CacheStorage: CacheGetStorage,
                              CacheRemoveStorage,
                              CacheSaveStorage {}



