//
//  MainTasksView.swift
//  eMasaryTask
//
//  Created by Mostafa Elshazly on 31/12/2022.
//

import Foundation

class MainTasksView: TasksView {

    override func setupView() {
        super.setupView()
        tasksTableView.register(MainTaskTableViewCell.self, forCellReuseIdentifier: "MainTaskTableViewCell")
    }
}
