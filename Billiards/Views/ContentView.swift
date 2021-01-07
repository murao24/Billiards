//
//  ContentView.swift
//  Billiards
//
//  Created by 村尾慶伸 on 2021/01/05.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var vm: ViewModel = ViewModel()
    
    var body: some View {
        
        VStack {
            
            List {
                
                Section(header: Text("Infomation")) {
                    
                    HStack {
                        
                        Slider(value: $vm.numOfParticipants, in: 1...6, step: 1.0) {
                            
                            Text("Number of participants")
                        }
                        
                        Spacer()
                        
                        Text("\(Int(vm.numOfParticipants))")
                        
                        Image(systemName: "person")
                    }
                    
                    HStack {
                        
                        Slider(value: $vm.numOfBalls, in: 1...4, step: 1.0) {
                            
                            Text("Number of balls")
                        }
                        
                        Spacer()
                        
                        Text("\(Int(vm.numOfBalls))")
                        
                        Image(systemName: "circle")
                    }
                }
            
            }
            .listStyle(InsetGroupedListStyle())
            
            NavigationLink(destination: DetailView(vm: vm)) {
                
                Text("next")
                    .autocapitalization(.allCharacters)
                    .font(.title)
                    .disabled(!vm.isValidated)
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
