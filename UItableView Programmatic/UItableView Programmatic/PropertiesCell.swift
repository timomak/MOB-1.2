//
//  PropertiesCell.swift
//  UItableView Programmatic
//
//  Created by timofey makhlay on 11/8/18.
//  Copyright © 2018 Timofey Makhlay. All rights reserved.
//

import UIKit

class PropertiesCell: UITableViewCell {

    var textForCell = UITextField()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Initialization code
        textForCell.text = "Hello"
        textForCell.backgroundColor = .blue
        textForCell.translatesAutoresizingMaskIntoConstraints = false
        
//        var viewB = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
//        viewB.backgroundColor = .blue
//        contentView.addSubview(viewB)
        contentView.addSubview(textForCell)
        NSLayoutConstraint.activate([
            textForCell.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: 100),
            textForCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            textForCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            textForCell.heightAnchor.constraint(equalToConstant: 100)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
