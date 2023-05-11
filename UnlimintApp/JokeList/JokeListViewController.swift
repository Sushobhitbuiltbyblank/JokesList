//
//  JokeListViewController.swift
//  UnlimintApp
//
//  Created by SUSHOBHIT JAIN on 07/05/23.
//

import UIKit

class JokeListViewController: UIViewController {
    
    var tableView: UITableView = UITableView()
    var viewModel: JokeListViewModelProtocol
    
    init(viewModel: JokeListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setUPData()
    }
    
    private func setupUI() {
        self.title = "Jokes"
        // Setup a UITableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)

        // Add constraints to UITableView
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    
    func setUPData() {
        viewModel.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        viewModel.viewDidDisappear()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        viewModel.viewDidDisappear()
    }
}

extension JokeListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.jokesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        guard let joke = viewModel.jokesAt(indexPath: indexPath) else { return UITableViewCell() }
        cell.textLabel?.text = joke
        cell.textLabel?.numberOfLines = 0
        return cell
    }
}

extension JokeListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // handle row selection
    }
}

extension JokeListViewController: JokeListViewProtocol {
    func reloadTableView() {
        self.tableView.reloadData()
    }
}
