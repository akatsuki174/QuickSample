//
//  RealmSpec.swift
//  QuickSampleTests
//
//  Created by akatsuki174 on 2016/02/23.
//  Copyright © 2016年 akatsuki174. All rights reserved.
//

import Quick
import Nimble
@testable import QuickSample

class RealmSpec: QuickSpec {
    
    override func spec() {
        describe("DBManager test") {
            let dbManager = DBManager()
            
            beforeEach {
                dbManager.deleteAll()
            }
            
            afterSuite {
                dbManager.deleteAll()
            }
            
            describe("findAll method") {
                context("when not exist data") {
                    it("output 0 data") {
                        let results = dbManager.findAll()!
                        expect(results.count).to(equal(0))
                    }
                }
                
                context("when exist data") {
                    it("find data") {
                        let expectGoods = self.createRealmGoods()
                        dbManager.update(expectGoods)
                        
                        let results = dbManager.findAll()!
                        let actualGoods = results[0]
                        
                        expect(results.count).to(equal(1))
                        expect(actualGoods.id).to(equal(expectGoods.id))
                        expect(actualGoods.name).to(equal(expectGoods.name))
                        expect(actualGoods.price).to(equal(expectGoods.price))
                        expect(actualGoods.stock).to(equal(expectGoods.stock))
                    }
                }
                
                context("when add some data") {
                    it("find data order by id") {
                        let first = 1
                        let second = 2
                        let third = 3
                        // add data id = 2, 3, 1
                        // id = second = 2
                        let expectGoods2 = self.createRealmGoods()
                        expectGoods2.id = second
                        dbManager.update(expectGoods2)
                        // id = third = 3
                        let expectGoods3 = self.createRealmGoods()
                        expectGoods3.id = third
                        dbManager.update(expectGoods3)
                        // id = first = 1
                        let expectGoods1 = self.createRealmGoods()
                        expectGoods1.id = first
                        dbManager.update(expectGoods1)
                        
                        let results = dbManager.findAll()!
                        let actualGoods1 = results[0]
                        let actualGoods2 = results[1]
                        let actualGoods3 = results[2]
                        
                        expect(results.count).to(equal(3))
                        expect(actualGoods1.id).to(equal(first))
                        expect(actualGoods2.id).to(equal(second))
                        expect(actualGoods3.id).to(equal(third))
                    }
                }
            }
            
            describe("update method") {
                context("when add new data") {
                    it("new data is inserted") {
                        let expectGoods = self.createRealmGoods()
                        dbManager.update(expectGoods)
                        
                        let results = dbManager.findAll()!
                        let actualGoods = results[0]
                        expect(actualGoods.id).to(equal(expectGoods.id))
                        expect(actualGoods.name).to(equal(expectGoods.name))
                        expect(actualGoods.price).to(equal(expectGoods.price))
                        expect(actualGoods.stock).to(equal(expectGoods.stock))
                    }
                }
                
                context("when add existing data") {
                    it("the data is updated") {
                        let expectGoods1 = self.createRealmGoods()
                        // add new data
                        dbManager.update(expectGoods1)
                        
                        // add the same id data
                        let expectGoods2 = self.createRealmGoods()
                        expectGoods2.name = "Goods!"
                        dbManager.update(expectGoods2)
                        
                        let results = dbManager.findAll()!
                        let actualGoods = results[0]
                        expect(results.count).to(equal(1))
                        expect(actualGoods.id).to(equal(expectGoods2.id))
                        expect(actualGoods.name).to(equal(expectGoods2.name))
                        expect(actualGoods.price).to(equal(expectGoods2.price))
                        expect(actualGoods.stock).to(equal(expectGoods2.stock))
                    }
                }
            }
            
            describe("deleteAll method") {
                it("delete all data") {
                    // add data
                    dbManager.update(self.createRealmGoods())
                    
                    // delete all data
                    dbManager.deleteAll()
                    
                    // find all data
                    let results = dbManager.findAll()!
                    expect(results.count).to(equal(0))
                }
            }
        }
    }
    
    func createRealmGoods() -> RealmGoods {
        let realmGoods = RealmGoods()
        realmGoods.id = 1
        realmGoods.name = "goods"
        realmGoods.price = 200
        realmGoods.stock = 1
        return realmGoods
    }
}
