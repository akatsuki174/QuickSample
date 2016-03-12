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
        
        describe("make sure if two numbers are almost the same") {
            it("can use beCloseTo") {
                expect(five_point_one).to(beCloseTo(five, within: 0.2))
            }
            
            it("can use '≈'") {
                // default delta is 0.0001
                expect(5.0001) ≈ five
                let delta = 0.2
                expect(five_point_one) ≈ (five, delta)
                expect(five_point_one) ≈ five ± delta
                expect(five_point_one) == five ± delta
            }
            
            it("can use array") {
                expect([0.00001, 2.00001]) ≈ [0.0, 2.0]
                expect([0.1, 2.1]).to(beCloseTo([0.0, 2.0], within: 0.2))
            }
        }
    }
    
}
