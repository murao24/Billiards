//
//  DetailVIew.swift
//  Billiards
//
//  Created by 村尾慶伸 on 2021/01/06.
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject var vm: ViewModel
    @State private var isNextAlert: Bool = false
    @State private var isShowAlert: Bool = false
    private var playerOrderString: String {
        
        if vm.playerOrder == Int(vm.numOfParticipants - 1) {
            
            return "last"
        }
        
        switch vm.playerOrder {
        case 0:
            return "first"
        case 1:
            return "second"
        case 2:
            return "third"
        case 3:
            return "fourth"
        case 4:
            return "fifth"
        case 5:
            return "sixth"
        case 6:
            return "seventh"
        default:
            return "last"
        }
    }
    
    var body: some View {
        
        VStack {
            
            List {
                
                Section {
                    
                    Text("Are you the \(playerOrderString) player?")
                    
                    Button(action: {
                        
                        isShowAlert = true
                    }) {
                        
                        Text("Check my numbers")
                    }
                    .alert(isPresented: $isShowAlert) {
                        
                        Alert(
                            title: Text("Your numbers are..."),
                            message: Text(vm.showMyNumbers())
                        )
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            
            Button(action: {
                
                isNextAlert = true
            }) {
                
                Text("Next")
                    .font(.title)
            }
            .alert(isPresented: $isNextAlert) {
                
                Alert(
                    title: Text("Have you memorized your numbers?"),
                    message: Text("If yes, tap next."),
                    primaryButton: .default(Text("Next"), action: {
                        
                        // go to next player...
                        vm.nextPlayer()
                    }),
                    secondaryButton: .cancel())
            }
        }
        .onAppear {
            
            vm.newGame()
            vm.shuffleNumbers()
        }
    }
}

struct DetailVIew_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(vm: ViewModel())
    }
}
