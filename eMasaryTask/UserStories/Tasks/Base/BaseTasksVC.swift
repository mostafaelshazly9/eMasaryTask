//
//  BaseTasksVC.swift
//  eMasaryTask
//
//  Created by Mostafa Elshazly on 31/12/2022.
//

import Foundation

class BaseTasksVC: BaseVC {

    var viewModel: TasksVM! /// Needs to be instantiated on loadView
    var contentView: TasksView!

    override func setupBindings() {
        Task {
            try await viewModel.getTasks()
        }

        viewModel.tasksPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] tasks in
                self?.contentView.reloadData()
            }.store(in: &cancellables)
    }
}
