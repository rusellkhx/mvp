//
//  BreedTableCell.swift
//  MVP_EXAMPLE
//
//  Created by Rusell on 06.09.2020.
//  Copyright © 2020 RusellKh. All rights reserved.
//

import UIKit

protocol BreedTableViewCellProtocol {
    func display(title: String?)
}

class BreedTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
}

extension BreedTableViewCell: BreedTableViewCellProtocol {
    
    func display(title: String?) {
         titleLabel.text = title
    }
}
