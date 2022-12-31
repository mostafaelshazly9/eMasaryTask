//
//  BaseTasksVC.swift
//  eMasaryTask
//
//  Created by Mostafa Elshazly on 31/12/2022.
//

import Foundation
import UIKit

class BaseTasksVC: BaseVC {

    var viewModel: TasksVM! /// Needs to be instantiated on loadView
    var contentView: TasksView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Task {
            try await viewModel.getTasks()
        }
    }

    override func setupBindings() {
        viewModel.$tasks
            .receive(on: DispatchQueue.main)
            .sink { [weak self] tasks in
                self?.contentView.reloadData()
            }.store(in: &cancellables)
    }

    private func setupNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(didTapAddBarButtonItem))
    }

    @objc private func didTapAddBarButtonItem() {
        let viewController = AddTaskVC()
        present(viewController, animated: true)
    }
}
