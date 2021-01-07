//
//  ViewModel.swift
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
}
