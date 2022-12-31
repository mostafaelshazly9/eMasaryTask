//
//  AddEditTaskView.swift
//  eMasaryTask
//
//  Created by Mostafa Elshazly on 31/12/2022.
//

import Foundation
import UIKit

class AddEditTaskView: BaseView {

    let scrollView = UIScrollView()
    let titleLabel = UILabel()
    let titleTextField = UITextField()
    let descriptionLabel = UILabel()
    let descriptionTextView = UITextView()
    let priorityLabel = UILabel()
    let priorityPickerView = UIPickerView()
    let dueDateLabel = UILabel()
    let dueDatePicker = UIDatePicker()
    let archivedLabel = UILabel()
    let archivedSwitch = UISwitch()
    let completedLabel = UILabel()
    let completedSwitch = UISwitch()

    override func setupView() {
        super.setupView()
        setupScrollView()
        setupTitleLabel()
        setupTitleTextField()
        setupDescriptionLabel()
        setupDescriptionTextView()
        setupPriorityLabel()
        setupPriorityPickerView()
        setupDueDateLabel()
        setupDueDatePicker()
        setupArchivedLabel()
        setupArchivedSwitch()
        setupCompletedLabel()
        setupCompletedSwitch()
    }

    private func setupScrollView() {
        addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
        scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
    }

    private func setupTitleLabel() {
        titleLabel.text = "Title:"

        scrollView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16).isActive = true
        titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 34).isActive = true
    }

    private func setupTitleTextField() {
        titleTextField.layer.cornerRadius = 8
        titleTextField.layer.borderWidth = 1

        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 40))
        titleTextField.leftView = paddingView
        titleTextField.leftViewMode = .always

        scrollView.addSubview(titleTextField)
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16).isActive = true
        titleTextField.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16).isActive = true
        titleTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16).isActive = true
        titleTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

    private func setupDescriptionLabel() {
        descriptionLabel.text = "Description:"

        scrollView.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 16).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 34).isActive = true
    }

    private func setupDescriptionTextView() {
        descriptionTextView.layer.cornerRadius = 8
        descriptionTextView.layer.borderWidth = 1
        descriptionTextView.textContainerInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)

        scrollView.addSubview(descriptionTextView)
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16).isActive = true
        descriptionTextView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16).isActive = true
        descriptionTextView.heightAnchor.constraint(equalToConstant: 120).isActive = true
    }

    private func setupPriorityLabel() {
        priorityLabel.text = "Priority:"

        scrollView.addSubview(priorityLabel)
        priorityLabel.translatesAutoresizingMaskIntoConstraints = false
        priorityLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16).isActive = true
        priorityLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16).isActive = true
        priorityLabel.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 16).isActive = true
        priorityLabel.heightAnchor.constraint(equalToConstant: 34).isActive = true
    }

    private func setupPriorityPickerView() {
        scrollView.addSubview(priorityPickerView)
        priorityPickerView.translatesAutoresizingMaskIntoConstraints = false
        priorityPickerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16).isActive = true
        priorityPickerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16).isActive = true
        priorityPickerView.topAnchor.constraint(equalTo: priorityLabel.bottomAnchor, constant: 16).isActive = true
        priorityPickerView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }

    private func setupDueDateLabel() {
        priorityLabel.text = "Due Date:"

        scrollView.addSubview(dueDateLabel)
        dueDateLabel.translatesAutoresizingMaskIntoConstraints = false
        dueDateLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16).isActive = true
        dueDateLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16).isActive = true
        dueDateLabel.topAnchor.constraint(equalTo: priorityPickerView.bottomAnchor, constant: 16).isActive = true
        dueDateLabel.heightAnchor.constraint(equalToConstant: 34).isActive = true
    }

    private func setupDueDatePicker() {
        scrollView.addSubview(dueDatePicker)
        dueDatePicker.translatesAutoresizingMaskIntoConstraints = false
        dueDatePicker.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        dueDatePicker.topAnchor.constraint(equalTo: dueDateLabel.bottomAnchor, constant: 16).isActive = true
        dueDatePicker.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    private func setupArchivedLabel() {
        archivedLabel.text = "Archived:"

        scrollView.addSubview(archivedLabel)
        archivedLabel.translatesAutoresizingMaskIntoConstraints = false
        archivedLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16).isActive = true
        archivedLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16).isActive = true
        archivedLabel.topAnchor.constraint(equalTo: dueDatePicker.bottomAnchor, constant: 16).isActive = true
        archivedLabel.heightAnchor.constraint(equalToConstant: 34).isActive = true
    }

    private func setupArchivedSwitch() {
        scrollView.addSubview(archivedSwitch)
        archivedSwitch.translatesAutoresizingMaskIntoConstraints = false
        archivedSwitch.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16).isActive = true
        archivedSwitch.centerYAnchor.constraint(equalTo: archivedLabel.centerYAnchor).isActive = true
    }

    private func setupCompletedLabel() {
        completedLabel.text = "Completed:"

        scrollView.addSubview(completedLabel)
        completedLabel.translatesAutoresizingMaskIntoConstraints = false
        completedLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16).isActive = true
        completedLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16).isActive = true
        completedLabel.topAnchor.constraint(equalTo: archivedLabel.bottomAnchor, constant: 16).isActive = true
        completedLabel.heightAnchor.constraint(equalToConstant: 34).isActive = true
    }

    private func setupCompletedSwitch() {
        scrollView.addSubview(completedSwitch)
        completedSwitch.translatesAutoresizingMaskIntoConstraints = false
        completedSwitch.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16).isActive = true
        completedSwitch.centerYAnchor.constraint(equalTo: completedLabel.centerYAnchor, constant: 16).isActive = true
        completedSwitch.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }

}
