//
//  TasksView.swift
//  eMasaryTask
//
//  Created by Mostafa Elshazly on 31/12/2022.
//

import Foundation
import UIKit

class TasksView: BaseView {

    let tasksTableView = UITableView()

    override func setupView() {
        super.setupView()
        setupTasksTableView()
    }

    func reloadData() {
        tasksTableView.reloadData()
    }

    private func setupTasksTableView() {
        tasksTableView.register(TaskTableViewCell.self, forCellReuseIdentifier: "TaskTableViewCell")

        addSubview(tasksTableView)
        tasksTableView.translatesAutoresizingMaskIntoConstraints = false
        tasksTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        tasksTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        tasksTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        tasksTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
