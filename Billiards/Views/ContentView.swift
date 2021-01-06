//
//  ContentView.swift
//  Billiards
//
//  Created by 村尾慶伸 on 2021/01/05.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var BiliVM: BiliViewModel = BiliViewModel()
    @State private var numOfBalls: Double = 3.0
    @State private var participants: [String] = []
    @State private var nameTextField: String = ""
    
    var body: some View {
        
        VStack {
            
            List {
                
                Section(header: Text("Infomation")) {
                    
                    HStack {
                        
                        Slider(value: $numOfBalls, in: 1...4, step: 1.0) {
                            
                            Text("Number of ball")
                        }
                        
                        Spacer()
                        
                        Text("\(Int(numOfBalls)) Ball")
                    }
                }
                
                Section(header: Text("Participant name")) {
                    
                    TextField("Enter your name", text: $nameTextField, onCommit: {
                        
                        if !nameTextField.isEmpty {
                            
                            self.participants.append(nameTextField)
                            self.nameTextField = ""
                        }
                    })
                    
                    Button(action: {} ) {
                        
                        Label("Add a new participant", systemImage: "plus.circle.fill")
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            
            NavigationLink(destination: DetailView(participants: participants)) {
                
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
