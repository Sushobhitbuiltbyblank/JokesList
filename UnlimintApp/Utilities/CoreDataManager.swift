//
//  CoreDataManager.swift
//  UnlimintApp
//
//  Created by SUSHOBHIT JAIN on 28/04/23.
//

import UIKit
import CoreData

class CoreDataManager {

    // MARK: - Properties
    
    static let shared = CoreDataManager()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "UnlimintApp")
        container.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Unresolved error \(error)")
            }
        }
        return container
    }()
    
    var mainContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    // MARK: - Core Data Operations
    
    func save() {
        guard mainContext.hasChanges else { return }
        
        do {
            try mainContext.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    func fetch<T: NSManagedObject>(entity: T.Type, predicate: NSPredicate? = nil, sortDescriptors: [NSSortDescriptor]? = nil) -> [T] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: entity))
        fetchRequest.predicate = predicate
        fetchRequest.sortDescriptors = sortDescriptors
        
        do {
            let results = try mainContext.fetch(fetchRequest) as? [T]
            return results ?? []
        } catch {
            print("Error fetching \(T.self) objects: \(error.localizedDescription)")
            return []
        }
    }
    
    func delete(object: NSManagedObject) {
        mainContext.delete(object)
        save()
    }
    
}
