//
//  MainTasksVM.swift
//  eMasaryTask
//
//  Created by Mostafa Elshazly on 31/12/2022.
//

import Foundation

class MainTasksVM: ObservableObject, TasksVM {

    @Published var tasks: [TodoTask] = []
    var tasksPublished: Published<[TodoTask]> { _tasks }
    var tasksPublisher: Published<[TodoTask]>.Publisher { $tasks }

    func getTasks() {
        // TODO: Add real code
        tasks = [TodoTask(todoTaskId: "123", title: "test", description: "desc", priority: "low", userId: "124124", dueDate: nil, archived: false, completed: false, lastModification: nil),
                 TodoTask(todoTaskId: "123", title: "test", description: "desc", priority: "normal", userId: "124124", dueDate: nil, archived: false, completed: false, lastModification: nil),
                 TodoTask(todoTaskId: "123", title: "test", description: "desc", priority: "high", userId: "124124", dueDate: nil, archived: false, completed: false, lastModification: nil),
                 TodoTask(todoTaskId: "123", title: "test", description: "desc", priority: "critical", userId: "124124", dueDate: nil, archived: false, completed: false, lastModification: nil)]
    }
}
