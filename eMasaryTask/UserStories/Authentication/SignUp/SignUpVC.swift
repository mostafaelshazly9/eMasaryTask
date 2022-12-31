//
//  SignUpVC.swift
//  eMasaryTask
//
//  Created by Mostafa Elshazly on 31/12/2022.
//

import Foundation
import UIKit

class SignUpVC: BaseVC {

    private let contentView = SignUpView()

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.delegate = self
    }
}

extension SignUpVC: AuthenticationViewDelegate {

    func didTapMainButton() {
        print("did tap main button")
    }

    func didTapSwitchButton() {
        navigationController?.popViewController(animated: true)
    }
}
