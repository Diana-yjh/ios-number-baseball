//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum InputError: Error {
    case invalidNumberOfMenu
    case invalidNumberOfUser
}

enum Menu: Int {
    case start = 1
    case exit = 2
}

var winNumberList: [Int] = []
var userNumberList: [Int] = []

func createRandomNumbers() -> [Int] {
    var randomNumbers: Set<Int> = []
    
    while randomNumbers.count < 3 {
        randomNumbers.insert(Int.random(in: 1...9))
    }
    return Array(randomNumbers)
}

func countStrikeBall(strikeCount: inout Int, ballCount: inout Int) {
    for index in 0 ..< winNumberList.count {
        if winNumberList[index] == userNumberList[index] {
            strikeCount += 1
        } else if winNumberList.contains(userNumberList[index]) {
            ballCount += 1
        }
    }
}

func choiceMenu() throws -> Int {
    print("1. 게임시작\n2. 게임종료\n원하는 기능을 선택해주세요 : ", terminator: "")
    
    let inputMenu = readLine()
    
    guard let menuString = inputMenu else {
        throw InputError.invalidNumberOfMenu
    }
    
    guard let menuRawValue = Int(menuString) else {
        throw InputError.invalidNumberOfMenu
    }
    return menuRawValue
}

func inputNumbers() throws {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.\n중복 숫자는 허용하지 않습니다.\n입력 : ", terminator: "")
    
    guard let inputNumber = readLine() else {
        throw InputError.invalidNumberOfUser
    }
    
    userNumberList = inputNumber.components(separatedBy: " ").compactMap{ Int($0) }
    
    guard userNumberList.count == 3 else {
        userNumberList = []
        throw InputError.invalidNumberOfUser
    }
    
    guard (1...9) ~= userNumberList[0] && (1...9) ~= userNumberList[1] && (1...9) ~= userNumberList[2]  else {
        userNumberList = []
        throw InputError.invalidNumberOfUser
    }
    
    let userNumberSet = Set(userNumberList)
    let userNumbers = Array(userNumberSet)
    
    guard userNumbers.count == 3 else {
        userNumberList = []
        throw InputError.invalidNumberOfUser
    }
}

func playGame(chance: inout Int, strikeCount: inout Int, ballCount: inout Int) {
    winNumberList = createRandomNumbers()
    
    while chance > 0 {
        do {
            try inputNumbers()
            countStrikeBall(strikeCount: &strikeCount, ballCount: &ballCount)
            chance -= 1
            
            print("\(strikeCount) 스트라이크, \(ballCount) 볼")
            
            if strikeCount == 3 {
                print("사용자 승리!")
                startGame()
                break
            }
            
            if chance != 0 {
                print("남은기회 : \(chance)")
            }
            else {
                print("컴퓨터 승리...!")
                startGame()
            }
            
            userNumberList.removeAll()
            strikeCount = 0
            ballCount = 0
        } catch InputError.invalidNumberOfUser {
            print("입력이 잘못되었습니다")
        } catch {
            print(error)
        }
    }
}

func startGame() {
    do {
        switch Menu(rawValue: try choiceMenu()) {
        case .start:
            var chance = 9
            var strikeCount = 0
            var ballCount = 0
            userNumberList.removeAll()
            playGame(chance: &chance, strikeCount: &strikeCount, ballCount: &ballCount)
        case .exit:
            return
        default:
            throw InputError.invalidNumberOfMenu
        }
    } catch InputError.invalidNumberOfMenu {
        print("입력이 잘못되었습니다")
        startGame()
    } catch {
        print(error)
    }
}

startGame()
