//
//  SignInVC.swift
//  eMasaryTask
//
//  Created by Mostafa Elshazly on 31/12/2022.
//

import Foundation
import UIKit

class SignInVC: UIViewController {

    let contentView = SignInView()

    override func loadView() {
        view = contentView
    }
}
