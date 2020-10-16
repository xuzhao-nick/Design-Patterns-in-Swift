//
//  SimpleMVVMCellTableViewCell.swift
//  MVVMPOC
//
//  Created by Nick Xu on 16/10/20.
//  Copyright © 2020 Nick Xu. All rights reserved.
//

import UIKit

class SimpleMVVMCell: UITableViewCell {

    var data: SimpleModel? {
        didSet {
            if let data = data {
                colorView.backgroundColor = data.color
                baseView.backgroundColor = data.color.withAlphaComponent(0.5)
                colorName.text = data.text
            }
        }
    }
    
    @IBOutlet private weak var colorView:UIView!
    @IBOutlet private weak var baseView:UIView!
    @IBOutlet private weak var colorName:UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView() {
        colorView.layer.cornerRadius = 40
        colorView.layer.masksToBounds = true
        baseView.layer.cornerRadius = 40
        baseView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner]
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
