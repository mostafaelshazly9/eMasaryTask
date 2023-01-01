//
//  TasksVM.swift
//  eMasaryTask
//
//  Created by Mostafa Elshazly on 31/12/2022.
//

import Foundation

class TasksVM: ObservableObject {

    let model: TasksModel!

    @Published var tasks: [TodoTask] = []

    init(model: TasksModel) {
        self.model = model
    }

    func getTasks() async throws {
        tasks = try await model.getTasks()
    }
}
