//
//  SignInVC.swift
//  eMasaryTask
//
//  Created by Mostafa Elshazly on 31/12/2022.
//

import Foundation
import UIKit

class SignInVC: UIViewController {

    private let contentView = SignInView()

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        contentView.delegate = self
    }
}

extension SignInVC: AuthenticationViewDelegate {

    func didTapMainButton() {
        print("did tap main button")
    }

    func didTapSwitchButton() {
        let viewController = SignUpVC()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
