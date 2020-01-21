//
//  ErrorHandlingSpec.swift
//  QuickSample
//
//  Created by akatsuki174 on 2016/03/13.
//  Copyright © 2016年 akatsuki174. All rights reserved.
//

import Quick
import Nimble

class ErrorHandlingSpec : QuickSpec {

    override func spec() {
        describe("catch error") {
            context("when occur error") {
                it("pass with throwError") {
                    let str = ""
                    expect{ try self.printStr(str: str) }.to(throwError())
                    
                    expect{ try self.printStr(str: str) }.to(throwError { (error: Error) in
                        expect(error._domain).to(equal("the value is empty"))
                        expect(error._code).to(equal(-1))
                    })
                    
                    expect{ try self.requestLogin(name: str) }.to(throwError(RequestError.Unknown))
                    expect{ try self.requestLogin(name: str) }.to(throwError(errorType: RequestError.self))
                }
            }
        }
    }
    
    func printStr(str: String) throws {
        if str.isEmpty {
            throw NSError(domain: "the value is empty", code: -1, userInfo: nil)
        } else {
            print(str)
        }
    }
    
    func requestLogin(name: String) throws {
        if name.isEmpty {
            throw RequestError.Unknown
        }
        // request processing...
    }
    
    enum RequestError: Error {
        case Network
        case Unknown
    }
}
