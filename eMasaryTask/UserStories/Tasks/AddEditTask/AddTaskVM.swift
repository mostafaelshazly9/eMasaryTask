//
//  AddTaskVM.swift
//  eMasaryTask
//
//  Created by Mostafa Elshazly on 01/01/2023.
//

import Foundation

protocol AddTaskVMDelegate: AnyObject {

    func showEmptyTitleError()
    func dismissScreen()
}

class AddTaskVM: ObservableObject {

    private let model = AddTaskModel()
    weak var delegate: AddTaskVMDelegate?

    func addTask(_ todo: TodoTask) {
        guard todo.title?.isEmpty == false else {
            delegate?.showEmptyTitleError()
            return
        }
        Task {
            try await model.createTODO(todo)
            delegate?.dismissScreen()
        }
    }
}
