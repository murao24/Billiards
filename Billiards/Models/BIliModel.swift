//
//  BIliModel.swift
//  Billiards
//
//  Created by 村尾慶伸 on 2021/01/06.
//

import Foundation

struct Bili: Identifiable {
    
    let id: UUID
    var numOfBalls: Int
    var numOfParticipants: Int
    var participants: [String]
}
