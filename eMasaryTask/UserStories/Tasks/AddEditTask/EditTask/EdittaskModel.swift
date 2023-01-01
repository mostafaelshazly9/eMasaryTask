//
//  EdittaskModel.swift
//  eMasaryTask
//
//  Created by Mostafa Elshazly on 01/01/2023.
//

import Foundation

class EditTaskModel {

    /// Update Todo
    func updateTODO(_ todo: TodoTask) async throws {
        let ref = FirebaseManager.db.collection("todos").document(todo.documentId)

        do {
            let snapshot = ref.setData([
                "title": todo.title ?? "",
                "description": todo.description ?? "",
                "priority": todo.priority ?? "",
                "userId": todo.userId ?? "",
                "dueDate": todo.dueDate ?? "",
                "archived": todo.archived ?? false,
                "completed": todo.completed ?? false,
                "lastModification": todo.lastModification ?? ""
            ], completion: { err in
                if let err = err {
                    // TODO: Handle errors
                    print(err)
                    return
                }
            })
        }
    }

    /// Delete Todo
    @discardableResult
    func deleteTODO(todoId: String) async throws -> String {
        try await withCheckedThrowingContinuation({ continuation in
            FirebaseManager.db.collection("todos").document(todoId).delete() { err in
                if let err = err {
                    // TODO: Handle errors
                    print(err)
                    continuation.resume(throwing: err)
                } else {
                    continuation.resume(returning: todoId)
                }
            }
        })
    }
}
