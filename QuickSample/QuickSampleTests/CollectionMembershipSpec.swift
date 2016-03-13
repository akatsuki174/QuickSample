//
//  CollectionMembershipSpec.swift
//  QuickSample
//
//  Created by akatsuki174 on 2016/03/13.
//  Copyright © 2016年 akatsuki174. All rights reserved.
//

import Quick
import Nimble

class CollectionMembershipSpec : QuickSpec {

    override func spec() {
        describe("collection membership") {
            context("when array is empty") {
                it("pass with beEmpty") {
                    let emptyArr:[String] = []
                    expect(emptyArr).to(beEmpty())
                }
            }
            context("when array is not empty") {
                let arr:[String]? = ["Swift", "Objective-C", "Python"]
                it("confirm array elements with contain()") {
                    expect(arr).to(contain("Swift", "Objective-C"))
                }
                
                it("can check first and last elements") {
                    expect(arr).to(beginWith("Swift"));
                    expect(arr).to(endWith("Python"));
                }
            }
            context("collection is not empty") {
                let arr = [1, 3, 5, 7]
                let set = Set<Int>(arrayLiteral: 1, 3, 5, 7)
                it("can check all elements match the condition") {
                    expect(arr).to(allPass({$0 < 10}))
                    expect(arr).to(allPass(beLessThan(10)))
                    
                    expect(set).to(allPass({$0 < 10}))
                    expect(set).to(allPass(beLessThan(10)))
                }
                it("can check collection count") {
                    expect(arr).to(haveCount(4))
                    expect(set).notTo(haveCount(5))
                }
            }
        }
    }
}
