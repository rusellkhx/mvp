//
//  SubBreedsViewController.swift
//  MVP_EXAMPLE
//
//  Created by Rusell on 08.09.2020.
//  Copyright © 2020 RusellKh. All rights reserved.
//

import UIKit

protocol SubBreedsViewControllerProtocol: class {
    func startActivityIdicator()
    func stopActivityIdicator()
    func reloadTable()
    func showMessageAlert(_ message: String)
    func showErrorAlert(message: String)
    func showChoiceAlert(title: String? , message: String?, customActions: [UIAlertAction])
    func pushToVC(_ vc: UIViewController)
}

class SubBreedsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var presenter: SubBreedsPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        presenter.getSubBreeds()
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
        title = presenter.breedName()
    }
}

extension SubBreedsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getCountItem()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.create(BreedTableViewCell.self, indexPath)
        presenter.configurateCell(cell, item: indexPath.row)
        return cell
    }
}

extension SubBreedsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.pressCell(indexPath.row)
    }
}

extension SubBreedsViewController: SubBreedsViewControllerProtocol {
    
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

