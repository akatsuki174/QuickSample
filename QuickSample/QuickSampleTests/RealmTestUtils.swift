//
//  RealmTestUtils.swift
//  QuickSample
//
//  Created by akatsuki174 on 2016/02/27.
//  Copyright © 2016年 akatsuki174. All rights reserved.
//

@testable import QuickSample

class RealmTestUtils {
    class func createRealmGoods() -> RealmGoods {
        let realmGoods = RealmGoods()
        realmGoods.id = 1
        realmGoods.name = "goods"
        realmGoods.price = 200
        realmGoods.stock = 1
        return realmGoods
    }

}
