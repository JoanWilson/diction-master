//
//  NSCacheStorage.swift
//  Infrastructure
//
//  Created by Joan Wilson Oliveira on 07/02/24.
//

import Domain
import Data

public final class NSCacheGetStorage: CacheGetStorage {
    private var wordDefinitionCache: NSCache<NSString, WordDefinition> = {
        let cache = NSCache<NSString, WordDefinition>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 100
        return cache
    }()
    
    public init() {}
    
    public func get(_ word: String) -> WordDefinition? {
        guard let wordDefinition = wordDefinitionCache.object(forKey: word as NSString) else {
            return nil
        }
        
        return wordDefinition
    }
}
