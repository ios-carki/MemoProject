//
//  WriteView.swift
//  MemoProject
//
//  Created by Carki on 2023/01/25.
//

import UIKit

import SnapKit

final class WriteView: BaseView {
    
    let writeView: UITextView = {
        let view = UITextView()
        view.textColor = .white
        view.font = .systemFont(ofSize: 18)
        return view
    }()
    
    override func configureUI() {
        self.addSubview(writeView)
    }
    
    override func setConstraints() {
        
        writeView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
    }
}
