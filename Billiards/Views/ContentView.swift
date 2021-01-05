//
//  ContentView.swift
//  Billiards
//
//  Created by 村尾慶伸 on 2021/01/05.
//

import SwiftUI

struct ContentView: View {
    
    @State private var numOfPeople: Double = 4.0
    @State private var numOfBall: Double = 3.0
    
    var body: some View {
        
        VStack {
            
            List {
                
                Section(header: Text("Infomation")) {
                    
                    HStack {
                        
                        Slider(value: $numOfPeople, in: 2...6, step: 1.0) {
                            
                            Text("Number of people")
                        }
                        
                        Spacer()
                        
                        Text("\(Int(numOfPeople)) People")
                    }
                    
                    HStack {
                        
                        Slider(value: $numOfBall, in: 1...4, step: 1.0) {
                            
                            Text("Number of ball")
                        }
                        
                        Spacer()
                        
                        Text("\(Int(numOfBall)) Ball")
                    }
                }
                
                Section(header: Text("Participant name")) {
                    
                    ForEach(0...Int(numOfPeople - 1), id: \.self) { index in
                        
                        Text("\(index + 1): 村尾")
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            
            NavigationLink(destination: DetailView()) {
                
                Text("next")
                    .autocapitalization(.allCharacters)
                    .font(.title)
            }
        }
        .navigationTitle(Text("Billiard"))
    }
}


struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ContentView()
    }
}
