//
//  MLAlertViewController.swift
//  Teste_ML
//
//  Created by Bruna Drago on 25/09/21.
//

import UIKit

class MLAlertViewController: UIViewController {

    // MARK: - Private Properties
    
    private lazy var alertView: MLAlertView = {
        return MLAlertView(self)
    }()
    
    // MARK: - Public Properties
    
    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
    
    // MARK: - Inits
    
    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = title
        self.message = message
        self.buttonTitle = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = alertView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alertView.set(title: alertTitle, message: message, buttonTitle: buttonTitle)
    }
}
// MARK: - MLAlertViewDelegate Extension

extension MLAlertViewController: MLAlertViewDelegate {
    
    func dismissVC() {
        dismiss(animated: true)
    }
}
