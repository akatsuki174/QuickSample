//
//  ComparisonsSpec.swift
//  QuickSample
//
//  Created by akatsuki174 on 2016/03/12.
//  Copyright © 2016年 akatsuki174. All rights reserved.
//

import Quick
import Nimble

class ComparisonsSpec: QuickSpec {
    
    override func spec() {
        let one:Double = 1
        let five:Double = 5
        let five_point_one:Double = 5.1
        
        describe("simple comparisons") {
            it("can compare functions and signs") {
                expect(one).to(beLessThan(five))
                expect(one) < five
                
                expect(one).to(beLessThanOrEqualTo(five))
                expect(one) <= five
                expect(one).to(beLessThanOrEqualTo(one))
                expect(one) <= one
                
                expect(five).to(beGreaterThan(one))
                expect(five) > one
                
                expect(five).to(beGreaterThanOrEqualTo(one))
                expect(five) >= one
                expect(one).to(beGreaterThanOrEqualTo(one))
                expect(one) >= one
            }
        }
    }
    
}
