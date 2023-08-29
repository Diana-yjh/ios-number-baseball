//
//  NumberBaseball - main.swift
//  Created by jyubong, morgan.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func getRandomNumbers() -> [Int] {
    var numbers: [Int] = []
    
    while numbers.count < 3 {
        let randomNumber = Int.random(in: 1...9)
        
        if !numbers.contains(randomNumber) {
            numbers.append(randomNumber)
        }
    }
    
    return numbers
}

func getResult(computerNumbers:[Int], userNumbers: [Int]) -> (Int, Int) {
    var (strike, ball) = (0,0)
    
    for index in 0..<userNumbers.count where computerNumbers.contains(userNumbers[index]) {
        if computerNumbers[index] == userNumbers[index] {
            strike += 1
        } else {
            ball += 1
        }
    }
    
    return (strike, ball)
}

func playNumberBaseBall() {
    var remainingCount: Int = 9
    var computerNumbers = getRandomNumbers()
    
    while remainingCount > 0 {
        let userNumbers = getRandomNumbers()
        let (strike, ball) = getResult(computerNumbers: computerNumbers, userNumbers: userNumbers)
        
        print("임의의 수 : ", terminator: "")
        for number in userNumbers {
            print("\(number) ", terminator: "")
        }
        print("")
        print("\(strike) 스트라이크, \(ball) 볼")
        
        if strike == 3 {
            print("유저의 승리...!")
            return
        } else {
            remainingCount -= 1
        }
        
        if remainingCount == 0 {
            print("컴퓨터의 승리...!")
            return
        } else {
            print("남은 기회 : \(remainingCount)")
        }
    }
}

playNumberBaseBall()
