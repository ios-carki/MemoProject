//
//  MainView.swift
//  MemoProject
//
//  Created by Carki on 2023/01/24.
//

import UIKit

import SnapKit

final class MainView: BaseView {
    
    let memoSearchBar: UISearchBar = {
        let view = UISearchBar()
        view.placeholder = "검색"
        return view
    }()
    
    let mainList: UITableView = {
        let view = UITableView()
        view.backgroundColor = .black
        return view
    }()
    
    override func configureUI() {
        
        [memoSearchBar, mainList].forEach {
            self.addSubview($0)
        }
        self.backgroundColor = .black
    }
    
    override func setConstraints() {
        
        memoSearchBar.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide)
        }
        
        mainList.snp.makeConstraints { make in
            make.top.equalTo(memoSearchBar.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
}
