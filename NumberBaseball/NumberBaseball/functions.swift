//
//  Functions.swift
//  NumberBaseball
//
//  Created by 유제민 on 2022/08/19.
//

import Foundation

func compareWithComputerNumbers(from userNumbers: [Int]) -> (Int, Int) {
    var strike = 0
    var ball = 0
    for index in 0...2 {
        if computerNumbers[index] == userNumbers[index] {
            strike += 1
        } else if userNumbers.contains(computerNumbers[index]) {
            ball += 1
        }
    }
    return (strike, ball)
}

func generateRandomNumbers() -> [Int] {
    var remainingNumbers = Array(1...9)
    var randomNumbers: [Int] = []
    while randomNumbers.count < 3 {
        let number = Int(arc4random_uniform(UInt32(remainingNumbers.count)))
        let selectedNumber = remainingNumbers[number]
        if selectedNumber != 0 {
            randomNumbers.append(selectedNumber)
        }
        remainingNumbers[number] = 0
    }
    return randomNumbers
}