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

    var body: some View {
        
        VStack {
            
            List {
                
                Section {
                    
                    Text("Are you the first player?")
                    
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
                        vm.playerOrder += 1
                    }),
                    secondaryButton: .cancel())
            }
        }
        .onAppear {
            
            vm.shuffleNumbers()
        }
    }
}

struct DetailVIew_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(vm: ViewModel())
    }
}
