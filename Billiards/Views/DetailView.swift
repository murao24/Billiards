//
//  DetailVIew.swift
//  Billiards
//
//  Created by 村尾慶伸 on 2021/01/06.
//

import SwiftUI

struct DetailView: View {
    
    @State private var playerOrder: Int = 0
    var balls: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15"]
    @Binding var numOfParticipants: Double
    @Binding var numOfBalls: Double

    var body: some View {
        
        List {
            
            Button(action: {}) {
                
                Text("Next")
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct DetailVIew_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(numOfParticipants: .constant(Double(4.0)), numOfBalls: .constant(Double(4.0)))
    }
}
