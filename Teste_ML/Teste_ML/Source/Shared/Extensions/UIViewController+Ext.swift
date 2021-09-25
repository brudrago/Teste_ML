//
//  UIViewController+Ext.swift
//  Teste_ML
//
//  Created by Bruna Drago on 25/09/21.
//

import UIKit
import SafariServices

extension UIViewController {
    
    func  presentAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = MLAlertViewController(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
    
    func showEmptyStateView(with message: String, in view: UIView) {
        let emptyStateView = MLEmptyStateView(message: message)
        emptyStateView.frame = view.bounds
        view.addSubview(emptyStateView)
    }
    
    func presentSafariViewController(with url: String) {
        guard let newURL = URL(string: url) else { return }
        let safariViewController = SFSafariViewController(url: newURL)
        safariViewController.preferredControlTintColor = .systemYellow
        present(safariViewController, animated: true)
    }
}
