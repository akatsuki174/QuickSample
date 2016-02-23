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
        
        describe("findAll method") {
            context("when not exist data") {
                it("output 0 data") {
                    let results = self.dbManager.findAll()!
                    expect(results.count).to(equal(0))
                }
            }
        }
    }
}
