//
//  MainViewController.swift
//  MemoProject
//
//  Created by Carki on 2023/01/24.
//

import UIKit

import RealmSwift

final class MainViewController: UIViewController {
    private let mainView = MainView()
    
    let testData: [String] = ["아아", "이이", "오오"]
    let testDate: [String] = ["월요일", "화요일", "일요일"]
    let testSub: [String] = ["안녕하세요라이라아ㅣ아ㅁㄴㅇㅁㄴㄹㅇ", "ㅁㄴㅇㄹㅁㅇㄴㄹㅁㄴㅇㄹㅁㄴㅇㄹㅁㄴㅇㄹ", "ㅁㄴㅇㄹㅁㄴㅇㄹㅁㄴㅇㄹㅇㅁㄹㅁㄴㅇㄹㅁㄹㅁㄴㅇㄹ"]
    
    let fixedData: [String] = ["이이", "오오"]
    let fixedDate: [String] = ["화요일", "수요일"]
    let fixedSub: [String] = ["안녕하세요라이라아ㅣ아ㅁㄴㅇㅁㄴㄹㅇ", "ㅁㄴㅇㄹㅁㅇㄴㄹㅁㄴㅇㄹㅁㄴㅇㄹㅁㄴㅇㄹ"]
    
    let localRealm = try! Realm()
    var id: ObjectId?
    var tasks: Results<Memo>! {
        didSet {
            mainView.mainList.reloadData()
            print("데이터 변함!")
        }
    }
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //RealmFile URL
        print("Realm is located at:", localRealm.configuration.fileURL!)
        fetchRealm()
        
        naviSetting()
        tableSetting()
        mainView.memoSearchBar.barTintColor = .darkGray
    }
    
    private func naviSetting() {
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "메모"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .darkGray
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        //툴바
        self.navigationController?.isToolbarHidden = false
        
        let writeButton = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(writeButtonClicked))
        writeButton.tintColor = .orange
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        var items = [UIBarButtonItem]()

        [flexibleSpace, writeButton].forEach {
            items.append($0)
        }

        self.toolbarItems = items
    }
    
    @objc func writeButtonClicked() {
        let writeVC = WriteViewController()
        
        self.navigationController?.pushViewController(writeVC, animated: true)
    }
    
    private func searchBarSetting() {
        mainView.memoSearchBar.delegate = self
    }
    
    private func tableSetting() {
        mainView.mainList.register(MainViewCell.self, forCellReuseIdentifier: MainViewCell.identidier)
        mainView.mainList.register(MainViewCellHeader.self, forHeaderFooterViewReuseIdentifier: MainViewCellHeader.identifier)
        
        mainView.mainList.dataSource = self
        mainView.mainList.delegate = self
    }
    
    func fetchRealm() {
        tasks = localRealm.objects(Memo.self)
            .sorted(byKeyPath: "regDate", ascending: false)
    }
}

extension MainViewController: UISearchBarDelegate {
    
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return fixedData.count
        } else {
            return testData.count
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: MainViewCellHeader.identifier) as? MainViewCellHeader else { return UITableViewHeaderFooterView() }
        
        if section == 0 {
            header.textLabel?.text = "고정된 메모"
            header.textLabel?.textColor = .white
            header.textLabel?.font = .systemFont(ofSize: 30, weight: .bold)
        } else {
            header.textLabel?.text = "메모"
            header.textLabel?.textColor = .white
            header.textLabel?.font = .systemFont(ofSize: 30, weight: .bold)
        }
        
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainViewCell.identidier) as? MainViewCell else { return UITableViewCell() }
        
        if indexPath.section == 0 {
            cell.mainText.text = fixedData[indexPath.row]
            cell.subText.text = fixedSub[indexPath.row]
            cell.dateText.text = fixedDate[indexPath.row]
        } else {
            cell.mainText.text = testData[indexPath.row]
            cell.subText.text = testSub[indexPath.row]
            cell.dateText.text = testDate[indexPath.row]
        }
        
        return cell
    }
    
    
}
