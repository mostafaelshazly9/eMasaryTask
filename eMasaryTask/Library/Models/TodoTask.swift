//
//  TodoTask.swift
//  eMasaryTask
//
//  Created by Mostafa Elshazly on 31/12/2022.
//

import Foundation

struct TodoTask: Decodable {

    let documentId: String
    let title: String?
    let description: String?
    let priority: String?
    let userId: String?
    let dueDate: String?
    let archived: Bool?
    let completed: Bool?
    let lastModification: String?
    var taskPriority: TodoTaskPriority? {
        .init(rawValue: priority ?? "")
    }

    enum TodoTaskPriority: String {
        case low, normal, high, critical
    }
}
