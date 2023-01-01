//
//  EditTaskVM.swift
//  eMasaryTask
//
//  Created by Mostafa Elshazly on 01/01/2023.
//

import Foundation

protocol EditTaskVMDelegate: AnyObject {

    func showEmptyTitleError()
    func dismissScreen()
}

class EditTaskVM: ObservableObject {

    var todo: TodoTask!

    private let model = EditTaskModel()
    weak var delegate: EditTaskVMDelegate?

    func editTask(_ todo: TodoTask) {
        guard todo.title?.isEmpty == false else {
            delegate?.showEmptyTitleError()
            return
        }
        Task {
            try await model.updateTODO(todo)
            delegate?.dismissScreen()
        }
    }

    func deleteTask() {
        Task {
            try await model.deleteTODO(todoId: todo.documentId)
            delegate?.dismissScreen()
        }
    }

}
