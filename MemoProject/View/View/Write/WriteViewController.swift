//
//  WriteViewController.swift
//  MemoProject
//
//  Created by Carki on 2023/01/25.
//

import UIKit

import RealmSwift

final class WriteViewController: UIViewController {
    private let mainView = WriteView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
