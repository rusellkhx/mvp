//
//  Extensions.swift
//  MVP_EXAMPLE
//
//  Created by Rusell on 07.09.2020.
//  Copyright © 2020 RusellKh. All rights reserved.
//

import UIKit
import Foundation

extension UIStoryboard {
    
    enum Storyboard {
        case BreedViewController
        case SubBreedsViewController
        
        var title: String {
            return String(describing: self)
        }
    }
    
    convenience init(storyboard: Storyboard) {
        self.init(name: storyboard.title, bundle: nil)
    }
    
    func instantiateViewController<T: UIViewController>(_ type: T.Type) -> T {
        let id = NSStringFromClass(T.self).components(separatedBy: ".").last!
        return self.instantiateViewController(withIdentifier: id) as! T
    }
}

extension UIView {
    
    class var identifier: String {
        return String(describing: self)
    }
}

extension UITableView {
    
    func register<T: UITableViewCell>(_ cell: T.Type) {
        self.register(UINib(nibName: T.identifier, bundle: nil), forCellReuseIdentifier: T.identifier)
    }
    func create<T: UITableViewCell>(_ cell: T.Type, _ indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: cell.identifier, for: indexPath) as! T
    }
}


extension UIViewController {
    
    class func instance(_ storyboard: UIStoryboard.Storyboard) -> Self {
           
           let storyboard = UIStoryboard(storyboard: storyboard)
           let viewController = storyboard.instantiateViewController(self)
           
           return viewController
    }
    
    func showMessageAlert(_ message: String) {
        self.showAlert(title: nil, message: message, completion: {})
    }
    
    func showErrorAlert(message: String) {
        self.showAlert(title: "Error", message: message, completion: {})
    }
    
    func showChoiceAlert(title: String? , message: String?, customActions: [UIAlertAction]) {
        self.showAlert(title: title, message: message, customActions: customActions, completion: {})
    }
    
    func showAlert(title: String?, message: String?, customActions: [UIAlertAction] = [], completion: @escaping () -> Void) {
        
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            
            if customActions.isEmpty {
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {action in completion()}))
            } else {
                for action in customActions {
                    alert.addAction(action)
                }
            }
            
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension StringProtocol {
    
    var firstUppercased: String {
        return prefix(1).uppercased() + dropFirst()
    }
}

