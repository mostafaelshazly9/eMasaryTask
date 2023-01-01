//
//  TasksTab.swift
//  eMasaryTask
//
//  Created by Mostafa Elshazly on 31/12/2022.
//

import Foundation
import UIKit

class TasksTab: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }

    private func setupTabBar() {
        let main = UINavigationController(rootViewController: MainTasksVC())
        main.tabBarItem = UITabBarItem(title: "Home",
                                       image: UIImage(systemName: "house"),
                                       selectedImage: UIImage(systemName: "house.fill"))

        let completed = UINavigationController(rootViewController: CompletedTasksVC())
        completed.tabBarItem = UITabBarItem(title: "Completed",
                                            image: UIImage(systemName: "checkmark.circle"),
                                            selectedImage: UIImage(systemName: "checkmark.circle.fill"))

        let archived = UINavigationController(rootViewController: ArchivedTasksVC())
        archived.tabBarItem = UITabBarItem(title: "Archived",
                                           image: UIImage(systemName: "archivebox"),
                                           selectedImage: UIImage(systemName: "archivebox.fill"))

        viewControllers = [main, completed, archived]
    }
}
