//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

private var significantFigures: Int = 9

private var randomNumbers: [Int] = []
private var usersClarifiedNumber: Set<Int> = []
private var computersClarifiedNumber: Set<Int> = []

private var strikeCount : Int = 0
private var ballCount : Int = 0

func run() {
    let computerNumber = Array(create(to: &randomNumbers, for: &computersClarifiedNumber))
    
    repeat {
        strikeCount = 0
        ballCount = 0
        significantFigures -= 1
        randomNumbers.removeAll()
        
        let userNumber = Array(create(to: &randomNumbers, for: &usersClarifiedNumber))
        print("임의의 수 : \(userNumber)")
        
        for index in 0...2 {
            comparison(of: userNumber, and: computerNumber, at: index)
        }
        
        print("\(strikeCount) 스트라이크, \(ballCount) 볼 ")
        print("남은 기회 : \(significantFigures)")
        
        if strikeCount == 3 {
            print("사용자 승리!")
            break
        } else if significantFigures == 0 {
            print("컴퓨터 승리!")
            break
        }
    } while strikeCount != 3 || significantFigures != 0
}

/// 컴퓨터와 사용자의 값을 비교하는 함수
private func comparison (of computer: [Int], and user: [Int], at position:Int) {
    if computer[position] == user[position] {
        strikeCount += 1
    } else if computer.contains(user[position]) {
        ballCount += 1
    }
}

/// 랜덤 숫자 3개 생성하여 배열에 저장 함수
private func create(to numbers: inout [Int], for numberSet: inout Set<Int>) -> Set<Int> {
    repeat {
        numbers.append(Int.random(in: 1...9))
        numberSet = Set(numbers)
    } while numberSet.count < 3
    return numberSet
}

run()
