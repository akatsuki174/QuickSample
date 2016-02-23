//
//  DBManager.swift
//  QuickSample
//
//  Created by akatsuki174 on 2016/02/23.
//  Copyright © 2016年 akatsuki174. All rights reserved.
//

import Foundation
import RealmSwift

class DBManager {
    func findAll() -> Results<RealmGoods>? {
        do {
            let realm = try Realm()
            return realm.objects(RealmGoods)
        }catch{
            print("failed")
        }
        return nil
    }
    
    func update(goods: RealmGoods) {
        do {
            let realm = try Realm()
            try! realm.write {
                realm.add(goods, update: true)
            }
        }catch{
            print("failed")
        }
    }
}