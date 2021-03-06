//
//  ViewController.swift
//  MVP_EXAMPLE
//
//  Created by Rusell on 02.09.2020.
//  Copyright © 2020 RusellKh. All rights reserved.
//

import UIKit

protocol BreedViewControllerProtocol: class {
    func startActivityIdicator()
    func stopActivityIdicator()
    func reloadTable()
    func pushToVC(_ vc: UIViewController)
    func showMessageAlert(_ message: String)
    func showErrorAlert(message: String)
    func showChoiceAlert(title: String? , message: String?, customActions: [UIAlertAction])
}

class BreedViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var presenter: BreedPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.getBreed()
        setupViews()
    }
    
    private func setupViews() {
        setupNavBar()
        setupTableView()
        activityIndicator.center = self.view.center
        startActivityIdicator()
    }
    
    private func setupTableView() {
        tableView.register(BreedTableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupNavBar() {
        title = HelperDescriptionImages.Navigation.titleBreeeds
    }
}

extension BreedViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getCountItem()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.create(BreedTableViewCell.self, indexPath)
        presenter.configurateCell(cell, item: indexPath.row)
        return cell
    }
}

extension BreedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.pressCell(indexPath.row)
    }
}

extension BreedViewController: BreedViewControllerProtocol {
    
    func startActivityIdicator() {
        DispatchQueue.main.async {
            self.activityIndicator.startAnimating()
        }
    }
    
    func stopActivityIdicator() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
        }
    }
    
    func reloadTable() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func pushToVC(_ vc: UIViewController) {
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}


