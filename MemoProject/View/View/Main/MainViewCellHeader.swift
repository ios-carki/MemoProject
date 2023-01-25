//
//  MainViewCellHeader.swift
//  MemoProject
//
//  Created by Carki on 2023/01/25.
//

import UIKit

import SnapKit

final class MainViewCellHeader: BaseHeader {
    static let identifier = "cellHeader"
    
    let headerLabel: UILabel = {
        let view = UILabel()
        
        return view
    }()
    
    override func configure() {
        self.addSubview(headerLabel)
    }
    
    override func setConstraints() {
        headerLabel.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
    }
}
