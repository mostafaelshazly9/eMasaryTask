//
//  BaseVC.swift
//  eMasaryTask
//
//  Created by Mostafa Elshazly on 31/12/2022.
//

import Foundation
import Combine
import UIKit

class BaseVC: UIViewController {

    var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }

    /// Meant to be overridden with connections to publishers and delegates
    func setupBindings() {

    }

    func showError(title: String = "Error", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Dismiss", style: .cancel)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}
