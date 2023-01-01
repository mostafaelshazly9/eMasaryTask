//
//  EditTaskVC.swift
//  eMasaryTask
//
//  Created by Mostafa Elshazly on 01/01/2023.
//

import Foundation
import UIKit

class EditTaskVC: BaseVC {

    let contentView = EditTaskView()
    let viewModel = EditTaskVM()
    let pickerViewDS = ["low", "normal", "high", "critical"]

    override func loadView() {
        super.loadView()
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        contentView.showTodo(viewModel.todo)
    }

    override func setupBindings() {
        viewModel.delegate = self
        contentView.delegate = self
        contentView.priorityPickerView.dataSource = self
        contentView.priorityPickerView.delegate = self
    }

    func setTodo(_ todo: TodoTask) {
        viewModel.todo = todo
    }

    private func setupNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(didTapEditBarButtonItem))
    }

    @objc private func didTapEditBarButtonItem() {
        let task = TodoTask(documentId: viewModel.todo.documentId,
                            title: contentView.titleTextField.text,
                            description: contentView.descriptionTextView.text,
                            priority: pickerViewDS[contentView.priorityPickerView.selectedRow(inComponent: 0)],
                            userId: viewModel.todo.userId,
                            dueDate: String(contentView.dueDatePicker.date.timeIntervalSince1970),
                            archived: contentView.archivedSwitch.isOn,
                            completed: contentView.completedSwitch.isOn,
                            lastModification: String(Date().timeIntervalSince1970))
        viewModel.editTask(task)
    }
}

extension EditTaskVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        4
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        pickerViewDS[row]
    }
}

extension EditTaskVC: EditTaskVMDelegate {

    func showEmptyTitleError() {
        showError(message: "Title cannot be empty")
    }

    func dismissScreen() {
        DispatchQueue.main.async { [weak self] in
            self?.navigationController?.dismiss(animated: true)
        }
    }
}

extension EditTaskVC: EditTaskViewDelegate {

    func didTapDelete() {
        viewModel.deleteTask()
    }
}
