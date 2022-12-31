//
//  BaseTasksModel.swift
//  eMasaryTask
//
//  Created by Mostafa Elshazly on 31/12/2022.
//

import Foundation

protocol TasksModel: AnyObject {

    func getTasks() async throws -> [TodoTask]
}
