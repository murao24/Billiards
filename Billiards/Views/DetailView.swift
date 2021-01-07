//
//  DetailVIew.swift
//  Billiards
//
//  Created by 村尾慶伸 on 2021/01/06.
//

import SwiftUI

struct DetailView: View {
    
    @State private var playerOrder: Int = 0
    private var balls: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15"]

    var body: some View {
        
        List {
            
            Text("")
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct DetailVIew_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
