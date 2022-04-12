//
//  String+Extensions.swift
//  NumberBaseball
//
//  Created by Derrick kim on 2022/04/12.
//

import Foundation

extension String {
    /// 필요한 내용 입력후 readline 출력.
    func input() -> String? {
        print(self, terminator: " ")
        
        return readLine()?.replacingOccurrences(of: " ", with: "")
    }
}
