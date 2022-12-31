//
//  TasksVM.swift
//  eMasaryTask
//
//  Created by Mostafa Elshazly on 31/12/2022.
//

import Foundation

protocol TasksVM: AnyObject {

    var tasks: [TodoTask] { get }
    var tasksPublished: Published<[TodoTask]> { get }
    var tasksPublisher: Published<[TodoTask]>.Publisher { get }

    func getTasks() async throws
}
