//
//  MainTasksVM.swift
//  eMasaryTask
//
//  Created by Mostafa Elshazly on 31/12/2022.
//

import Foundation
import FirebaseFirestore

class MainTasksVM: ObservableObject, TasksVM {

    @Published var tasks: [TodoTask] = []
    var tasksPublished: Published<[TodoTask]> { _tasks }
    var tasksPublisher: Published<[TodoTask]>.Publisher { $tasks }

    func getTasks() async throws {
        guard let userId = UserDefaults.standard.value(forKey: "userId") as? String else { return }
        let ref = FirebaseManager.db.collection("todos")
            .whereField("userId", isEqualTo: userId)
            .whereField("archived", isEqualTo: false)
            .whereField("completed", isEqualTo: false)

        do {
            let snapshot = try await ref.getDocuments()
            tasks = snapshot.documents.compactMap { document in
                return try? JSONDecoder().decode(TodoTask.self, fromJSONObject: document.prepareForDecoding())
            }
        } catch let error {
            // TODO: Handle error, probably by retrieving the local list
            print(error)
        }
    }
}
