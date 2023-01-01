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
