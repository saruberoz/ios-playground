//: Playground - noun: a place where people can play

import UIKit


2 + 2
123*456
var str: String = "Look what I can do!"
var age: Int = 18
var costOfCandy: Double = 1.25
var hungry: Bool = true
var name: String = "Ryland"
name = "Ry"

var favoriteVideoGame: String = "Mario Kart"
favoriteVideoGame = "Super Smash Bros"

let life: Int = 42
let pi: Double = 3.14
let canTouchThis: Bool = false
let captain: String = "Kirk"

var luckyNumber = 7

var apples = 5
print("Sally has \(apples) apples")
print("Sally has \(apples - 5) apples")


var secondsLeft = 3
while (secondsLeft > 0) {
    print(secondsLeft)
    secondsLeft -= 1
}
print("Blast off!")

var cokesLeft = 7
var fantasLeft = 4
while(cokesLeft > 0) {
    print("You have \(cokesLeft) Cokes left.")
    cokesLeft -= 1
    if(cokesLeft <= fantasLeft) {
        break
    }
}
print("You stop drinking Cokes.")


var numbers = 0
while(numbers <= 10) {
    if(numbers == 9) {
        numbers += 1
        continue
    }
    print(numbers)
    numbers += 1
}

var optionalNumber: Int? = 5
optionalNumber = nil

if let number = optionalNumber {
    print("It is a number")
} else {
    print("It is not a number")
}

var languagesLearned: String = "3"
var languagesLearnedNum: Int? = Int(languagesLearned)


if let num = languagesLearnedNum {
    print("It is a number")
} else {
    print("It is not a number")
}


func randomIntBetween(low:Int, high:Int) -> Int {
    let range = high - (low - 1)
    return (Int(arc4random()) % range) + (low - 1)
}

let answer = randomIntBetween(1, high: 100)

print("Enter a number between 1 and 100.")

var guess = 7

if(guess > answer) {
    print("Lower!")
} else if (guess < answer) {
    print("Higher")
} else {
    print("Correct! The answer was \(answer)")
}



class Person  {
    var firstName = ""
    var lastName = ""
    var age = 0
    
    func input() -> String {
        let keyboard = NSFileHandle.fileHandleWithStandardInput()
        let inputData = keyboard.availableData
        let rawString = NSString(data: inputData, encoding:NSUTF8StringEncoding)
        if let string = rawString {
            return string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        } else {
            return "Invalid input"
        }
    }
    
    func changeFirstName(newFirstName:String)  {
        firstName = newFirstName
    }
    
    func enterInfo()  {
        print("What is the first name?")
        firstName = input()
    }
    
    func printInfo()  {
        print("First Name: \(firstName)")
    }
    
}

var newPerson = Person()
newPerson.firstName = "Ry"
newPerson.lastName = "Bristow"
newPerson.age = 18

