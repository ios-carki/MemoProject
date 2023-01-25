//
//  BaseHeader.swift
//  MemoProject
//
//  Created by Carki on 2023/01/25.
//

import UIKit

class BaseHeader: UITableViewHeaderFooterView {
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure() { }
    
    func setConstraints() { }
}
