//
//  TruthinessSpec.swift
//  QuickSample
//
//  Created by akatsuki174 on 2016/03/12.
//  Copyright © 2016年 akatsuki174. All rights reserved.
//

import Quick
import Nimble

class TruthinessSpec : QuickSpec {
    override func spec() {
        describe("make sure truthiness") {
            context("when actual is true") {
                it("pass with both beTruthy and beTrue") {
                    let bl:Bool? = true
                    expect(bl).to(beTruthy())
                    expect(bl).to(beTrue())
                }
            }

            context("when actual is not nil") {
                it("pass with beTruthy") {
                    let str:String? = "hoge"
                    expect(str).to(beTruthy())
                }
            }
            
            context("when actual is false") {
                it("pass with both beFalsy and beFalse") {
                    let bl:Bool? = false
                    expect(bl).to(beFalsy())
                    expect(bl).to(beFalse())
                }
            }

            context("when actual is nil") {
                let bl:Bool? = nil
                it("pass with beFalsy") {
                    expect(bl).to(beFalsy())
                }
                
                it("pass with beNil") {
                    expect(bl).to(beNil())
                }
            }
        }
    }
}
