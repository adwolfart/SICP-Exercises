// Chapter 1 - Building Abstrations with Procedures

// Exercise 1.1
10
5 + 3 + 4
9 - 1
6 / 2
(2 * 4) + (4 - 6)
let a = 3
let b = a + 1
(a * b) + a + b
a == b
if ((b > a) && (b < (a * b))) {
    b
} else {
    a
}
switch 4 {
case a:
    6
case b:
    6 + 7 + a
default:
    25
}
// Alternative to above
switch true {
case a == 4:
    6
case b == 4:
    6 + 7 + a
default:
    25
}
((b > a) ? b : a) + 2
switch true {
case a > b:
    a * (a + 1)
case a < b:
    b * (a + 1)
default:
    -1 * (a + 1)
}


// Exercise 1.2
// let inOneGo = (5 + 4 + (2 - (3 - (6 + (4.0 / 5))))) / (3.0 * (6 - 2) * (2 - 7)) // Fails due to the calculation taking too long!!! That is pretty ordinary performance on Swift's part.
let numerator = (5 + 4 + (2 - (3 - (6 + (4.0 / 5)))))
let denominator: Double = (3 * (6 - 2) * (2 - 7))
let answer = numerator / denominator


// Exercise 1.3 - Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.
func square(x: Int) -> Int {
    return x * x
}
func sumOfSquares(x: Int, y: Int) -> Int {
    return square(x) + square(y)
}

func sumOfSquaresOfTwoLargest(a: Int, b: Int, c: Int) -> Int {
    switch true {
    case min(a, b, c) == a:
        return sumOfSquares(b, c)
    case min(a, b, c) == b:
        return sumOfSquares(a, c)
    case min(a, b, c) == c:
        return sumOfSquares(a, b)
    default:
        println("Something went badly wrong with the sumOfSquaresOfTwoLargest() function")
        return 0
    }
}
sumOfSquaresOfTwoLargest(6, 2, 4)


// Exercise 1.4 - Observe that our model of evaluation allows for combinations whose operators are compound expressions. Use this observation to describe the behaviou of the following procedure
// (define (a-plus-abs-b a b) ((if (> b 0) + -) a b))
func aPlusABSb(a: Int, b: Int) -> Int {
    if (b > 0) {
        return a + b
    } else {
        return a - b
    }
}
aPlusABSb(4, 5)
aPlusABSb(4, -5)
// Swift doesn't really have the same ability as lisp in this regard. In the function above two entire blocks of code which use different operators can be selected between but the operator of a particular procedure is not being set at runtime.


// Exercise 1.5 - Ben Bitdiddle has invented a test to determine whether the interpreter he is faced with is using applicative-order evaluation or normal-order evaluation. He defines the following two procedures:
/*
func p() -> () {
    return p()
}

func test(x:Int, y: () -> ()) -> Int {
    if (x == 0) {
        return 0
    } else {
        return y
    }
}
I don't think this one makes much sense in Swift. I can't see how we can have a function that returns a closure or number for a start and also the test doesn't really dig into how swift works (as best I can understand.
*/

func square(x: Double) -> Double {
    return x * x
}

// 1.1.7 Example: Square Roots by Newton's Method
// Functions are declarative knowledge and procedures are imperative knowledge. Meaning that functions describe functions of things and procedures describe how to do things.

// How does one compute square roots?
// Guess a value, y, for the value of the square root of a number x. Find the quotient of x divided by the guess. Average the quotient and the guess. Continue till you have an accurate enough answer.

func sqrtIter(guess: Double, x: Double) -> Double {
    if (goodEnough(guess, x)) {
        return guess
    } else {
        return sqrtIter(improve(guess, x), x)
    }
}

func improve(guess: Double, x: Double) -> Double {
    return average(guess, (x / guess))
}
func average(x: Double, y: Double) -> Double {
    return ((x + y) / 2)
}
func goodEnough(guess: Double, x: Double) -> Bool {
    return abs((guess * guess) - x) < 0.001
}
func sqrt(x: Double) -> Double {
    return sqrtIter(1.0, x)
}

sqrt(9)
sqrt(100 + 37)
sqrt(sqrt(2) + sqrt(3))
square(sqrt(1000))
