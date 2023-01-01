//
//  ArchivedTasksModel.swift
//  eMasaryTask
//
//  Created by Mostafa Elshazly on 31/12/2022.
//

import Foundation

class ArchivedTasksModel: TasksModel {

    func getTasks() async throws -> [TodoTask] {
        guard let userId = UserDefaults.standard.value(forKey: "userId") as? String else { return [] }
        let ref = FirebaseManager.db.collection("todos")
            .whereField("userId", isEqualTo: userId)
            .whereField("archived", isEqualTo: true)
        do {
            let snapshot = try await ref.getDocuments()
            return snapshot.documents.compactMap { document in
                return try? JSONDecoder()
                    .decode(TodoTask.self, fromJSONObject: document.prepareForDecoding())
            }
        } catch let error {
            // TODO: Handle error, probably by retrieving the local list
            print(error)
            return []
        }
    }
}
