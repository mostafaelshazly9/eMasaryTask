//
//  EditTaskView.swift
//  eMasaryTask
//
//  Created by Mostafa Elshazly on 01/01/2023.
//

import Foundation
import UIKit

protocol EditTaskViewDelegate: AnyObject {

    func didTapDelete()
}

class EditTaskView: AddTaskView {

    let deleteButton = UIButton()
    weak var delegate: EditTaskViewDelegate?


    override func setupView() {
        super.setupView()
        completedSwitchBottomConstraint.isActive = false
        setupDeleteButton()
    }

    func showTodo(_ todo: TodoTask) {
        titleTextField.text = todo.title
        descriptionTextView.text = todo.description
        dueDatePicker.setDate(Date(timeIntervalSince1970: Double(todo.dueDate ?? "0") ?? 0), animated: false)
        archivedSwitch.isOn = todo.archived ?? false
        completedSwitch.isOn = todo.completed ?? false

        let selectedRow = ["low", "normal", "high", "critical"].firstIndex(of: todo.priority ?? "") ?? 0
        priorityPickerView.selectRow(selectedRow, inComponent: 0, animated: true)
    }

    private func setupDeleteButton() {
        deleteButton.setTitle("  Delete  ", for: .normal)
        deleteButton.setTitleColor(.red, for: .normal)
        deleteButton.layer.cornerRadius = 8
        deleteButton.layer.borderWidth = 1
        deleteButton.layer.borderColor = UIColor.red.cgColor
        deleteButton.tintColor = .red

        deleteButton.addTarget(self, action: #selector(didTapDelete), for: .touchUpInside)

        scrollView.addSubview(deleteButton)
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        deleteButton.topAnchor.constraint(equalTo: completedLabel.bottomAnchor, constant: 16).isActive = true
        deleteButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        deleteButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }

    @objc private func didTapDelete() {
        delegate?.didTapDelete()
    }
}
