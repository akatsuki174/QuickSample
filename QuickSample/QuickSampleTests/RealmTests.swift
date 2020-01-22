//
//  RealmTests.swift
//  QuickSample
//
//  Created by akatsuki174 on 2016/02/27.
//  Copyright © 2016年 akatsuki174. All rights reserved.
//

import XCTest
@testable import QuickSample

// FIXME: realm-cocoa の Xcode 11, iOS 13対応
//class xRealmTests : XCTestCase {
//    let dbManager = DBManager()
//    
//    override func setUp() {
//        super.setUp()
//        dbManager.deleteAll()
//    }
//    
//    class override func tearDown() {
//        let dbManager = DBManager()
//        dbManager.deleteAll()
//        super.tearDown()
//    }
//    
//    func testDBManagerTest_findAllMethod_whenNotExistData_output0Data() {
//        let results = dbManager.findAll()!
//        XCTAssertEqual(results.count, 0, "Expect \(results.count) to equal 0")
//    }
//    
//    func testDBManagerTest_findAllMethod_whenExistData_findData() {
//        let expectGoods = RealmTestUtils.createRealmGoods()
//        dbManager.update(goods: expectGoods)
//        
//        let results = dbManager.findAll()!
//        let actualGoods = results[0]
//        
//        XCTAssertEqual(results.count, 1, "Expect \(results.count) to equal 1")
//        XCTAssertEqual(actualGoods.id, expectGoods.id, "Expect \(actualGoods.id) to equal \(expectGoods.id)")
//        XCTAssertEqual(actualGoods.name, expectGoods.name, "Expect \(actualGoods.name) to equal \(expectGoods.name)")
//        XCTAssertEqual(actualGoods.price, expectGoods.price, "Expect \(actualGoods.price) to equal \(expectGoods.price)")
//        XCTAssertEqual(actualGoods.stock, expectGoods.stock, "Expect \(actualGoods.stock) to equal \(expectGoods.stock)")
//    }
//    
//    func testDBManagerTest_findAllMethod_whenAddSomeData_findDataOrderById() {
//        let first = 1
//        let second = 2
//        let third = 3
//        // add data id = 2, 3, 1
//        // id = second = 2
//        let expectGoods2 = RealmTestUtils.createRealmGoods()
//        expectGoods2.id = second
//        dbManager.update(goods: expectGoods2)
//        // id = third = 3
//        let expectGoods3 = RealmTestUtils.createRealmGoods()
//        expectGoods3.id = third
//        dbManager.update(goods: expectGoods3)
//        // id = first = 1
//        let expectGoods1 = RealmTestUtils.createRealmGoods()
//        expectGoods1.id = first
//        dbManager.update(goods: expectGoods1)
//    
//        let results = dbManager.findAll()!
//        let actualGoods1 = results[0]
//        let actualGoods2 = results[1]
//        let actualGoods3 = results[2]
//        
//        XCTAssertEqual(results.count, 3, "Expect \(results.count) to equal 3")
//        XCTAssertEqual(actualGoods1.id, first, "Expect \(actualGoods1.id) to equal \(first)")
//        XCTAssertEqual(actualGoods2.id, second, "Expect \(actualGoods2.id) to equal \(second)")
//        XCTAssertEqual(actualGoods3.id, third, "Expect \(actualGoods3.id) to equal \(third)")
//    }
//    
//    func testDBManagerTest_updateMethod_whenAddNewData_newDataIsInserted() {
//        let expectGoods = RealmTestUtils.createRealmGoods()
//        dbManager.update(goods: expectGoods)
//        
//        let results = dbManager.findAll()!
//        let actualGoods = results[0]
//        
//        XCTAssertEqual(actualGoods.id, expectGoods.id, "Expect \(actualGoods.id) to equal \(expectGoods.id)")
//        XCTAssertEqual(actualGoods.name, expectGoods.name, "Expect \(actualGoods.name) to equal \(expectGoods.name)")
//        XCTAssertEqual(actualGoods.price, expectGoods.price, "Expect \(actualGoods.price) to equal \(expectGoods.price)")
//        XCTAssertEqual(actualGoods.stock, expectGoods.stock, "Expect \(actualGoods.stock) to equal \(expectGoods.stock)")
//    }
//    
//    func testDBManagerTest_updateMethod_whenAddExistngData_theDataIsUpdated() {
//        let expectGoods1 = RealmTestUtils.createRealmGoods()
//        // add new data
//        dbManager.update(goods: expectGoods1)
//    
//        // add the same id data
//        let expectGoods2 = RealmTestUtils.createRealmGoods()
//        expectGoods2.name = "Goods!"
//        dbManager.update(goods: expectGoods2)
//        
//        let results = dbManager.findAll()!
//        let actualGoods = results[0]
//        
//        XCTAssertEqual(results.count, 1, "Expect \(results.count) to equal 1")
//        XCTAssertEqual(actualGoods.id, expectGoods2.id, "Expect \(actualGoods.id) to equal \(expectGoods2.id)")
//        XCTAssertEqual(actualGoods.name, expectGoods2.name, "Expect \(actualGoods.name) to equal \(expectGoods2.name)")
//        XCTAssertEqual(actualGoods.price, expectGoods2.price, "Expect \(actualGoods.price) to equal \(expectGoods2.price)")
//        XCTAssertEqual(actualGoods.stock, expectGoods2.stock, "Expect \(actualGoods.stock) to equal \(expectGoods2.stock)")
//    }
//    
//    func testDBManagerTest_deleteAllMethod() {
//        // add data
//        dbManager.update(goods: RealmTestUtils.createRealmGoods())
//    
//        // delete all data
//        dbManager.deleteAll()
//        
//        // find all data
//        let results = dbManager.findAll()!
//        
//        XCTAssertEqual(results.count, 0, "Expect \(results.count) to equal 0")
//    }
//}
