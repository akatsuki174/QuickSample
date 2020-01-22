class FizzBuzz {
    func fizzBuzz(num: Int) -> String {
        if num % 15 == 0 { return "Fizz Buzz" }
        if num % 3 == 0 { return "Fizz" }
        if num % 5 == 0 { return "Buzz" }
        return String(num)
    }
}
