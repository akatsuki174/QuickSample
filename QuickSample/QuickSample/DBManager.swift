//
//  DBManager.swift
//  QuickSample
//
//  Created by akatsuki174 on 2016/02/23.
//  Copyright © 2016年 akatsuki174. All rights reserved.
//

import RealmSwift

class DBManager {
    func findAll() -> Results<RealmGoods>? {
        do {
            let realm = try Realm()
            return realm.objects(RealmGoods.self).sorted(byKeyPath: "id")
        } catch {
            print("failed")
        }
        return nil
    }
    
    func update(goods: RealmGoods) {
        do {
            let realm = try Realm()
            try! realm.write {
                realm.add(goods, update: .modified)
            }
        } catch {
            print("failed")
        }
    }
    
    func deleteAll() {
        do {
            let realm = try Realm()
            try! realm.write {
                realm.deleteAll()
            }
        } catch {
            print("failed")
        }
    }
}
