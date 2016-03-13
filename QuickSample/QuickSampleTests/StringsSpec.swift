//
//  StringsSpec.swift
//  QuickSample
//
//  Created by akatsuki174 on 2016/03/13.
//  Copyright © 2016年 akatsuki174. All rights reserved.
//

import Quick
import Nimble

class StringsSpec : QuickSpec {

    override func spec() {
        describe("strings") {
            it("can check strings contents") {
                let str = "My favorite language is Swift."
                let emptyStr = ""
                expect(str).to(contain("Swift"))
                expect(str).to(beginWith("My"))
                expect(str).to(endWith("."))
                expect(str).to(match("My*"))
                expect(emptyStr).to(beEmpty())
            }
        }
    }
}
