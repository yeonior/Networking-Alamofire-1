//
//  MyViewController.swift
//  Networking-Alamofire-1
//
//  Created by Ruslan on 13.06.2022.
//

import UIKit

final class MyViewController: UIViewController {
    
    // MARK: - Subviews
    private let myTableView = UITableView()
    private let networkManager = NetworkManager.shared
    
    // MARK: - Properties
    private var myArray: [MyModel] = []
    
    // MARK: - Lifecylce
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        networkManager.fetchData { [weak self] data in
            self?.myArray = data
            self?.myTableView.reloadData()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureMyTableViewFrame()
    }
    
    // MARK: - Methods
    private func configureViews() {
        title = "MyTable"
        view.addSubview(myTableView)
        myTableView.dataSource = self
    }
    
    private func configureMyTableViewFrame() {
        myTableView.frame = view.bounds
    }
}

// MARK: - UITableViewDataSource
extension MyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier) ?? MyTableViewCell(style: .subtitle, reuseIdentifier: MyTableViewCell.identifier)
        
        cell.textLabel?.text = myArray[indexPath.row].title
        cell.detailTextLabel?.text = myArray[indexPath.row].body
        
        return cell
    }
}
