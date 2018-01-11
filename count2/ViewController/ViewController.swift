//
//  ViewController.swift
//  count2
//
//  Created by ST20591 on 2018/01/09.
//  Copyright © 2018年 ha1f. All rights reserved.
//

import UIKit

struct CountersTableCellViewModel {
    let title: String
    let instantiateViewController: () -> UIViewController
}

class ViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.rowHeight = 50
        view.delegate = self
        view.dataSource = self
        view.tableFooterView = UIView()
        return view
    }()
    
    fileprivate var viewModel: [CountersTableCellViewModel] = [
        CountersTableCellViewModel(title: "normal") {
            return NormalCountViewController()
        },
        CountersTableCellViewModel(title: "timer") {
            return TimerCountViewController()
        }
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Constants.backgroundColor
        title = "Count"
        
        view.addSubview(tableView)
        tableView.constraintTo(safeAreaOf: view)
    }
    
    fileprivate func moveToViewController(at index: Int) {
        guard self.viewModel.indices.contains(index) else {
            return
        }
        let viewModel = self.viewModel[index]
        
        let viewController = viewModel.instantiateViewController()
        viewController.title = viewModel.title
        self.show(viewController, sender: nil)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = viewModel[indexPath.row].title
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        moveToViewController(at: indexPath.row)
    }
}

