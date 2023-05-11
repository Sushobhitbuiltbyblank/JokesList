//
//  JokesStorageManager.swift
//  UnlimintApp
//
//  Created by SUSHOBHIT JAIN on 07/05/23.
//

import Foundation

protocol JokesStorageManagerProtocol {
    var limit: Int { get set }
    func save(joke:String)
    func fetchJokes() -> [String]
    func deleteOldest()
}

class JokesStorageManager: JokesStorageManagerProtocol {
    var limit: Int
    
    let coreDataManager: CoreDataManager
    
    init(coreDataManager: CoreDataManager, limit: Int) {
        self.coreDataManager = coreDataManager
        self.limit = limit
    }
    
    func save(joke:String) {
        checkLogic()
        let jokeObject = Joke(context: coreDataManager.mainContext)
        jokeObject.name = joke
        coreDataManager.save()
    }
    
    func checkLogic() {
        if self.fetchJokes().count >= limit {
            deleteOldest()
        }
    }
    
    func fetchJokes() -> [String] {
        let coreDataManager = CoreDataManager.shared
        let fetchedObjects = coreDataManager.fetch(entity: Joke.self)
        return fetchedObjects.map{$0.name ?? ""}
    }
    
    func deleteOldest() {
        let coreDataManager = CoreDataManager.shared
        let fetchedObjects = coreDataManager.fetch(entity: Joke.self)
        if let objectToDelete = fetchedObjects.first {
            coreDataManager.delete(object: objectToDelete)
        }
    }
}

