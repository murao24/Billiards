//
//  DetailVIew.swift
//  Billiards
//
//  Created by 村尾慶伸 on 2021/01/06.
//

import SwiftUI

struct DetailView: View {
    
    var participants: [String]

    var body: some View {
        
        List {
            
            ForEach(participants, id: \.self) { participant in
                
                Text(participant)
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct DetailVIew_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(participants: [""])
    }
}
