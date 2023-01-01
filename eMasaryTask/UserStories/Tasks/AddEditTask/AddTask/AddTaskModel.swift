//
//  AddTaskModel.swift
//  eMasaryTask
//
//  Created by Mostafa Elshazly on 31/12/2022.
//

import Foundation

class AddTaskModel {

    /// Create Todo
    func createTODO(_ todo: TodoTask) async throws {
        guard let userId = UserDefaults.standard.value(forKey: "userId") as? String else { return }

        let ref = FirebaseManager.db.collection("todos")

        do {
            let snapshot = ref.addDocument(data: [
                "title": todo.title ?? "",
                "description": todo.description ?? "",
                "priority": todo.priority ?? "",
                "userId": userId,
                "dueDate": todo.dueDate ?? "",
                "archived": todo.archived ?? false,
                "completed": todo.completed ?? false,
                "lastModification": todo.lastModification ?? ""
            ]) { err in
                if let err = err {
                    // TODO: Handle errors
                    print(err)
                    return
                }
            }
        }
    }
}
