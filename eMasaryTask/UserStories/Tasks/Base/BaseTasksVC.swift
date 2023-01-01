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
        let viewController = UINavigationController(rootViewController: AddTaskVC())
        present(viewController, animated: true)
    }
}

extension BaseTasksVC: UITableViewDelegate, UITableViewDataSource {

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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = EditTaskVC()
        viewController.setTodo(viewModel.tasks[indexPath.row])
        navigationController?.present(UINavigationController(rootViewController: viewController), animated: true)
    }
}
