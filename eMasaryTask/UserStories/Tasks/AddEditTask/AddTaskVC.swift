//
//  AddTaskVC.swift
//  eMasaryTask
//
//  Created by Mostafa Elshazly on 31/12/2022.
//

import Foundation
import UIKit

class AddTaskVC: BaseVC {

    let contentView = AddEditTaskView()
    let viewModel = AddTaskVM()
    let pickerViewDS = ["low", "normal", "high", "critical"]

    override func loadView() {
        super.loadView()
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
    }

    override func setupBindings() {
        viewModel.delegate = self
        contentView.priorityPickerView.dataSource = self
        contentView.priorityPickerView.delegate = self
    }

    private func setupNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(didTapAddBarButtonItem))
    }

    @objc private func didTapAddBarButtonItem() {
        let task = TodoTask(documentId: "",
                            title: contentView.titleTextField.text,
                            description: contentView.descriptionTextView.text,
                            priority: pickerViewDS[contentView.priorityPickerView.selectedRow(inComponent: 0)],
                            userId: "",
                            dueDate: String(contentView.dueDatePicker.date.timeIntervalSince1970),
                            archived: contentView.archivedSwitch.isOn,
                            completed: contentView.completedSwitch.isOn,
                            lastModification: String(Date().timeIntervalSince1970))
        viewModel.addTask(task)
    }
}

extension AddTaskVC: UIPickerViewDelegate, UIPickerViewDataSource {
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

extension AddTaskVC: AddTaskVMDelegate {

    func showEmptyTitleError() {
        showError(message: "Title cannot be empty")
    }

    func dismissScreen() {
        DispatchQueue.main.async { [weak self] in
            self?.navigationController?.dismiss(animated: true)
        }
    }
}
