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
        }
    }
}