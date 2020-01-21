//
//  DistinguishClassSpec.swift
//  QuickSample
//
//  Created by akatsuki174 on 2016/03/12.
//  Copyright © 2016年 akatsuki174. All rights reserved.
//

import Quick
import Nimble

class DistinguishClassSpec: QuickSpec {
    
    override func spec() {
        describe("make sure a instance class") {
            let animal = Animal()
            let cat = Cat()
            it("can use beAnInstanceOf") {
                expect(animal).to(beAnInstanceOf(Animal.self))
            }
            it("can use beAKindOf") {
                expect(cat).to(beAKindOf(Animal.self))
                expect(cat).to(beAKindOf(Cat.self))
            }
        }
    }
}

class Animal : NSObject {
    let name: String = ""
}

class Cat : Animal {
    
}
