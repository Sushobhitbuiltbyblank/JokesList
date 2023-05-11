//
//  JokeListViewModel.swift
//  UnlimintApp
//
//  Created by SUSHOBHIT JAIN on 07/05/23.
//

import Foundation

class JokeListViewModel: JokeListViewModelProtocol {
    
    private var jokeList: [String] = [String]()
    var storeManager: JokesStorageManagerProtocol
    var scheduler: Scheduler?
    weak var view: JokeListViewProtocol?

    init(storeManager: JokesStorageManagerProtocol) {
        self.storeManager = storeManager
    }
    
    func viewDidLoad() {
        startScheduler()
        self.jokeList = self.fetchRecordFromStorage()
        view?.reloadTableView()
    }
    
    func fetchRecordFromStorage() -> [String] {
        return storeManager.fetchJokes()
    }
    
    func viewDidDisappear() {
        scheduler?.stop()
    }

    func jokesCount() -> Int {
        return jokeList.count
    }
    
    func jokesAt(indexPath: IndexPath) -> String? {
        let index = indexPath.row
        if index < jokesCount() {
            return jokeList[index]
        } else {
            return nil
        }
    }
    
    private func startScheduler() {
        scheduler = Scheduler(timeInterval: 60.0, action: { [weak self] in
            self?.fetchJoke()
        })
        scheduler?.start()
    }
    
    private func fetchJoke() {
        let request = APIRequest(resource: JokesResource())
        request.load { [weak self] joke in
            var jokeStr = joke
            jokeStr.replace("\"", with: "")
            DispatchQueue.main.async {
                self?.storeManager.save(joke: jokeStr)
                self?.jokeList = self?.fetchRecordFromStorage() ?? []
                self?.view?.reloadTableView()
            }
        }
    }
    
    
}
