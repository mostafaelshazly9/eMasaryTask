//
//  AddTaskVC.swift
//  eMasaryTask
//
//  Created by Mostafa Elshazly on 31/12/2022.
//

import Foundation
import UIKit

class AddTaskVC: BaseVC {

    let contentView = AddEditTaskView()
    let pickerViewDS = ["low", "normal", "high", "critical"]

    override func loadView() {
        super.loadView()
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
    }

    override func setupBindings() {
        contentView.priorityPickerView.dataSource = self
        contentView.priorityPickerView.delegate = self
    }

    private func setupNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(didTapAddBarButtonItem))
    }

    @objc private func didTapAddBarButtonItem() {
        let viewController = AddTaskVC()
        present(viewController, animated: true)
    }
}

extension AddTaskVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        4
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        pickerViewDS[row]
    }
}
