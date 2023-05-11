//
//  JokeListProtocols.swift
//  UnlimintApp
//
//  Created by SUSHOBHIT JAIN on 07/05/23.
//

import UIKit

protocol JokeListViewModelProtocol {
    var view: JokeListViewProtocol? { get set }
    func viewDidLoad()
    func viewDidDisappear()
    func jokesCount() -> Int
    func jokesAt(indexPath: IndexPath) -> String?
}


protocol JokeListViewProtocol: AnyObject {
    func reloadTableView()
}

protocol JokeListCoodinatorProtocol: Coordinator {}
