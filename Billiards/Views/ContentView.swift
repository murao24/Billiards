//
//  ContentView.swift
//  Billiards
//
//  Created by 村尾慶伸 on 2021/01/05.
//

import SwiftUI

struct ContentView: View {

    @State private var numOfParticipants: Double = 4.0
    @State private var numOfBalls: Double = 3.0
    
    var body: some View {
        
        VStack {
            
            List {
                
                Section(header: Text("Infomation")) {
                    
                    HStack {
                        
                        Slider(value: $numOfParticipants, in: 1...6, step: 1.0) {
                            
                            Text("Number of participants")
                        }
                        
                        Spacer()
                        
                        Text("\(Int(numOfParticipants))")
                        
                        Image(systemName: "person")
                    }
                    
                    HStack {
                        
                        Slider(value: $numOfBalls, in: 1...4, step: 1.0) {
                            
                            Text("Number of balls")
                        }
                        
                        Spacer()
                        
                        Text("\(Int(numOfBalls))")
                        
                        Image(systemName: "circle")
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
