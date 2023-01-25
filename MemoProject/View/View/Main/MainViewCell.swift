//
//  mainViewCell.swift
//  MemoProject
//
//  Created by Carki on 2023/01/25.
//

import UIKit

import SnapKit

final class MainViewCell: BaseTableViewCell {
    static let identidier = "mainCell"
    
    let mainText: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 18, weight: .heavy)
        view.textColor = .white
        return view
    }()
    
    let dateText: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 14)
        view.textColor = .gray
        return view
    }()
    
    let subText: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 14)
        view.textColor = .gray
        return view
    }()
    
    override func configure() {
        [mainText, dateText, subText].forEach {
            self.addSubview($0)
        }
        self.backgroundColor = .darkGray
    }
    
    override func setConstraints() {
        
        mainText.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(20)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalTo(24)
        }
        
        dateText.snp.makeConstraints { make in
            make.top.equalTo(mainText.snp.bottom).offset(8)
            make.leading.equalTo(safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(subText.snp.leading).offset(-12)
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-12)
        }
        
        subText.snp.makeConstraints { make in
            make.top.equalTo(mainText.snp.bottom).offset(8)
            make.trailing.equalTo(safeAreaLayoutGuide).offset(-20)
        }
    }
}
