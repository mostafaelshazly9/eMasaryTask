//
//  CoreDataService.swift
//  eMasaryTask
//
//  Created by Mostafa Elshazly on 01/01/2023.
//

import Foundation
import UIKit

class CoreDataService {

    static let shared = CoreDataService()
    private let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext

    func getTodoTasks() -> [TodoTaskCD] {
        guard let context else { return [] }

        do {
            return try context.fetch(TodoTaskCD.fetchRequest())
        } catch let error {
            print("Error:", error)
        }
        return []
    }

    func addTodoTask(_ todo: TodoTask) {
        guard let context else { return }

        let task = TodoTaskCD(context: context)
        task.documentId = todo.documentId
        task.title = todo.title ?? ""
        task.todoDescription = todo.description ?? ""
        task.priority = todo.priority ?? ""
        task.userId = todo.userId ?? ""
        task.dueDate = todo.dueDate ?? ""
        task.archived = todo.archived ?? false
        task.completed = todo.completed ?? false
        task.lastModification = todo.lastModification ?? ""

        do {
            try context.save()
        } catch let error {
            print("Error:", error)
        }
    }

    func updateTask(_ todo: TodoTaskCD, newTodo: TodoTask) {
        guard let context else { return }

        todo.documentId = newTodo.documentId
        todo.title = newTodo.title ?? ""
        todo.todoDescription = newTodo.description ?? ""
        todo.priority = newTodo.priority ?? ""
        todo.userId = newTodo.userId ?? ""
        todo.dueDate = newTodo.dueDate ?? ""
        todo.archived = newTodo.archived ?? false
        todo.completed = newTodo.completed ?? false
        todo.lastModification = newTodo.lastModification ?? ""

        do {
            try context.save()
        } catch let error {
            print("Error:", error)
        }
    }

    func deleteTask(_ todo: TodoTaskCD) {
        guard let context else { return }

        context.delete(todo)

        do {
            try context.save()
        } catch let error {
            print("Error:", error)
        }

    }
}
