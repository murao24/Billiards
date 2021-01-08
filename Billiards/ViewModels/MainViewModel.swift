//
//  MainViewModel.swift
//  Billiards
//
//  Created by 村尾慶伸 on 2021/01/07.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    
    @Published var numOfParticipants: Double = 4.0
    @Published var numOfBalls: Double = 3.0
    @Published var isValidated: Bool = true
    @Published var balls: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15"]
    @Published var playerOrder: Int = 0
    
    private var cancellable: Set<AnyCancellable> = []
    
    
    init() {
        
        Publishers.CombineLatest($numOfParticipants, $numOfBalls)
            .receive(on: RunLoop.main)
            .map { (p, b) in
                
                return p * b <= 15
            }
            .assign(to: \.isValidated, on: self)
            .store(in: &cancellable)
    }
    
    func shuffleNumbers() {
        
        balls.shuffle()
    }
    
    func nextPlayer() {
        
        guard !balls.isEmpty else { return }
        balls.removeSubrange(0...Int(numOfBalls - 1))
        
        if playerOrder < Int(numOfParticipants - 1) {
            
            playerOrder += 1
        } else if playerOrder == Int(numOfParticipants - 1) {
            
            newGame()
        }
    }
    
    func showMyNumbers() -> String {

        return "\(balls.prefix(Int(numOfBalls)))"
    }
    
    func newGame() {
        
        balls = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15"]
        playerOrder = 0
    }
}
