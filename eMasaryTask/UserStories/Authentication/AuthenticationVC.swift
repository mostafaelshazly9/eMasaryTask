//
//  AuthenticationVC.swift
//  eMasaryTask
//
//  Created by Mostafa Elshazly on 31/12/2022.
//

import Foundation
import UIKit

class AuthenticationVC: UIViewController {

    let contentView = AuthenticationView()

    override func loadView() {
        view = contentView
    }
}
