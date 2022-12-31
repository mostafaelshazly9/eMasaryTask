//
//  ArchivedTasksVC.swift
//  eMasaryTask
//
//  Created by Mostafa Elshazly on 31/12/2022.
//

import Foundation
import UIKit

class ArchivedTasksVC: BaseTasksVC {

    override func loadView() {
        contentView = TasksView()
        view = contentView
        viewModel = TasksVM(model: ArchivedTasksModel())
    }

    override func setupBindings() {
        super.setupBindings()
        contentView.tasksTableView.delegate = self
        contentView.tasksTableView.dataSource = self
    }
}

extension ArchivedTasksVC: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "TaskTableViewCell",
            for: indexPath) as? TaskTableViewCell else { return UITableViewCell() }
        cell.configure(for: viewModel.tasks[indexPath.row])
        return cell
    }
}
