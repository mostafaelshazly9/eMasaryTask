//
//  MainTasksVC.swift
//  eMasaryTask
//
//  Created by Mostafa Elshazly on 31/12/2022.
//

import Foundation
import UIKit

class MainTasksVC: BaseTasksVC {

    override func loadView() {
        contentView = MainTasksView()
        view = contentView
        viewModel = MainTasksVM()
    }

    override func setupBindings() {
        super.setupBindings()
        contentView.tasksTableView.delegate = self
        contentView.tasksTableView.dataSource = self
    }
}

extension MainTasksVC: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "MainTaskTableViewCell",
            for: indexPath) as? MainTaskTableViewCell else { return UITableViewCell() }
        cell.configure(for: viewModel.tasks[indexPath.row])
        return cell
    }
}
