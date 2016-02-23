//
//  RealmSpec.swift
//  QuickSampleTests
//
//  Created by akatsuki174 on 2016/02/23.
//  Copyright © 2016年 akatsuki174. All rights reserved.
//

import XCTest
import Quick
import Nimble
@testable import QuickSample

class RealmSpec: QuickSpec {
    let dbManager = DBManager()
    
    override func spec() {
        
        beforeEach {
            self.dbManager.deleteAll()
        }
        
        afterSuite {
            self.dbManager.deleteAll()
        }
        
        describe("findAll method") {
            context("when not exist data") {
                it("output 0 data") {
                    let results = self.dbManager.findAll()!
                    expect(results.count).to(equal(0))
                }
            }
            
            context("when exist data") {
                it("find data") {
                    let expectGoods = self.createRealmGoods()
                    self.dbManager.update(expectGoods)
                    
                    let results = self.dbManager.findAll()!
                    let actualGoods = results[0]
                    
                    expect(results.count).to(equal(1))
                    expect(actualGoods.id).to(equal(expectGoods.id))
                    expect(actualGoods.name).to(equal(expectGoods.name))
                    expect(actualGoods.price).to(equal(expectGoods.price))
                    expect(actualGoods.stock).to(equal(expectGoods.stock))
                }
            }
        }
        
        describe("update method") {
            context("when add new data") {
                it("new data is inserted") {
                    let expectGoods = self.createRealmGoods()
                    self.dbManager.update(expectGoods)
                    
                    let results = self.dbManager.findAll()!
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
                    self.dbManager.update(expectGoods1)
                    
                    // add the same id data
                    let expectGoods2 = self.createRealmGoods()
                    expectGoods2.name = "Goods!"
                    self.dbManager.update(expectGoods2)
                    
                    let results = self.dbManager.findAll()!
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
                self.dbManager.update(self.createRealmGoods())
                
                // delete all data
                self.dbManager.deleteAll()
                
                // find all data
                let results = self.dbManager.findAll()!
                expect(results.count).to(equal(0))
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
