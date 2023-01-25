//
//  Memo.swift
//  MemoProject
//
//  Created by Carki on 2023/01/25.
//

import Foundation

import RealmSwift

class Memo: Object {
    @Persisted var title: String
    @Persisted var contents: String
    @Persisted var regDate = Date()
    @Persisted var fixed = false
    
    @Persisted(primaryKey: true) var objectID: ObjectId
    
    convenience init(title: String, contents: String, regDate: Date, fixed: Bool) {
        self.init()
        self.title = title
        self.contents = contents
        self.regDate = regDate
        self.fixed = fixed
    }
}

/*
 class Todo: Object, ObjectKeyIdentifiable {
     
     @Persisted var todo: String?
     @Persisted var favorite: Bool
     @Persisted var importance: Int
     @Persisted var regDate = Date()
     @Persisted var stringDate: String
     @Persisted var isFinished: Bool
     
     @Persisted(primaryKey: true) var objectID: ObjectId
     
     convenience init(todo: String?, favorite: Bool, importance: Int, regDate: Date, stringDate: String, isFinished: Bool) {
         self.init()
         self.todo = todo
         self.favorite = favorite
         self.importance = importance
         self.regDate = regDate
         self.stringDate = stringDate
         self.isFinished = isFinished
     }
     
     
 }

 */
