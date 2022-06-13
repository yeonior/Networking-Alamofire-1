//
//  MyViewController.swift
//  Networking-Alamofire-1
//
//  Created by Ruslan on 13.06.2022.
//

import UIKit

class MyViewController: UIViewController {
    
    // MARK: - Subviews
    let myTableView = UITableView()
    
    // MARK: - Properties
    var myArray: [String] = []
    
    // MARK: - Lifecylce
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
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
        myTableView.delegate = self
        myTableView.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.identifier)
    }
    
    private func configureMyTableViewFrame() {
        myTableView.frame = view.bounds
    }
}

extension MyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as? MyTableViewCell else { return UITableViewCell() }
        
        cell.textLabel?.text = "MyTableViewCell"
        
        return cell
    }
}

extension MyViewController: UITableViewDelegate {
    
}
