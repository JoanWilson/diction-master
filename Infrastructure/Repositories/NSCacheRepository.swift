//
//  NSCacheStorage.swift
//  Infrastructure
//
//  Created by Joan Wilson Oliveira on 07/02/24.
//

import Domain
import Data

public final class NSCacheRepository: CacheRepository {
    private var wordDefinitionCache: NSCache<NSString, WordDefinitionCache> = {
        let cache = NSCache<NSString, WordDefinitionCache>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 100
        return cache
    }()
    
    static public let shared: CacheRepository = NSCacheRepository()
    
    private init() {}
    
    public func get(_ word: String) -> WordDefinition? {
        guard let wordDefinition = wordDefinitionCache.object(
            forKey: word.lowercased() as NSString
        ) else {
            return nil
        }
        
        return wordDefinition.wordDefinition
    }
    
    public func save(_ word: String, wordDefinition: WordDefinition) {
        wordDefinitionCache.setObject(
            WordDefinitionCache(wordDefinition: wordDefinition),
            forKey: word.lowercased() as NSString
        )
    }
}

class WordDefinitionCache: NSObject, NSDiscardableContent {
    public var wordDefinition: WordDefinition
    
    init(wordDefinition: WordDefinition) {
        self.wordDefinition = wordDefinition
    }
    
    func beginContentAccess() -> Bool {
        true
    }
    
    func endContentAccess() {}
    
    func discardContentIfPossible() {}
    
    func isContentDiscarded() -> Bool {
        false
    }
}
