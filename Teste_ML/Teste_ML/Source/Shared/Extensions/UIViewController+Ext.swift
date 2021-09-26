//
//  UIViewController+Ext.swift
//  Teste_ML
//
//  Created by Bruna Drago on 25/09/21.
//

import UIKit
import SafariServices

fileprivate var containerView: UIView!

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
    
    func startLoading() {
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        
        UIView.animate(withDuration: 0.25) {
            containerView.alpha = 0.8
        }
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .systemYellow
        
        containerView.addSubview(activityIndicator)
        
        activityIndicator.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        activityIndicator.startAnimating()
    }
    
    func stopLoading() {
        DispatchQueue.main.async {
            containerView.removeFromSuperview()
            containerView = nil
        }
    }
    
    
    
    func showLoadingIndicator() {
        if self.view.viewWithTag(1000) != nil {
            return
        }
        
        let loadingView = UIView()
        loadingView.frame = view.bounds
        loadingView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        loadingView.backgroundColor = UIColor.white.withAlphaComponent(0.75)
        loadingView.layer.zPosition = 10
        loadingView.tag = 1000
        
        let spinner = SpinnerView()
        spinner.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        loadingView.addSubview(spinner)
        
        spinner.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.width.equalTo(60)
            make.center.equalTo(loadingView)
        }
        
        self.view.addSubview(loadingView)
    }
    
    func hideLoading() {
        let seconds = 0.7
        let delay = seconds * Double(NSEC_PER_SEC)  // nanoseconds per seconds
        let dispatchTime = DispatchTime.now() + Double(Int64(delay)) / Double(NSEC_PER_SEC)
        
        DispatchQueue.main.asyncAfter(deadline: dispatchTime, execute: {
            if let viewWithTag = self.view.viewWithTag(1000) {
                viewWithTag.removeFromSuperview()
            }
        })
    }
}

