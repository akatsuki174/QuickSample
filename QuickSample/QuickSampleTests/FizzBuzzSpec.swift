import Quick
import Nimble

@testable import QuickSample
class FizzBuzzSpec : QuickSpec {

    override func spec() {
        let fizzBuzz = FizzBuzz()
        
        describe("fizzBuzz method") {
            context("when enter 2") {
                it("should return 2") {
                    expect("2").to(equal(fizzBuzz.fizzBuzz(num: 2)))
                }
            }
            context("when enter 3") {
                it("should return 'Fizz'") {
                    expect("Fizz").to(equal(fizzBuzz.fizzBuzz(num: 3)))
                }
            }
            context("when enter 5") {
                it("should return 'Buzz'") {
                    expect("Buzz").to(equal(fizzBuzz.fizzBuzz(num: 5)))
                }
            }
            context("when enter 15") {
                it("should return 'Fizz Buzz'") {
                    expect("Fizz Buzz").to(equal(fizzBuzz.fizzBuzz(num: 15)))
                }
            }
        }
    }
}

