//
//  TaskTableViewCell.swift
//  eMasaryTask
//
//  Created by Mostafa Elshazly on 31/12/2022.
//

import Foundation
import UIKit

class TaskTableViewCell: UITableViewCell {

    let titleLabel = UILabel()
    let priorityView = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(for task: TodoTask) {
        titleLabel.text = task.title ?? ""
            switch task.taskPriority {
            case .low:
                priorityView.backgroundColor = .green

            case .normal:
                priorityView.backgroundColor = .yellow

            case .high:
                priorityView.backgroundColor = .orange

            case .critical:
                priorityView.backgroundColor = .red

            default:
            priorityView.backgroundColor = .clear
        }
    }

    private func setupView() {
        backgroundColor = .white
        setupTitleLabel()
        setupPriorityView()
    }

    private func setupTitleLabel() {
        titleLabel.textColor = .black

        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }

    private func setupPriorityView() {
        priorityView.backgroundColor = .clear
        priorityView.layer.cornerRadius = 15

        addSubview(priorityView)
        priorityView.translatesAutoresizingMaskIntoConstraints = false
        priorityView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        priorityView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        priorityView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        priorityView.widthAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
