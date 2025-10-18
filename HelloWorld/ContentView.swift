//
//  ContentView.swift
//  HelloWorld
//
//  Created by Eatzaz Hafiz on 16/10/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var goal = "Week"
    @State private var selectedDuration: String = ""
    
    var body: some View {
        VStack{
            ZStack{
                Button("􀙭"){
                    
                }
                .frame(width: 109, height: 109)
                .background(Color.color1)
                .clipShape(Circle())
                .glassEffect()
                
//                Image("fire")
//                    .frame(width: 109, height: 109)
//                    .background(Color.horange)
//                    .clipShape(Circle())
//
//                    .padding()
                

                
            }
            .padding()
            
            VStack(alignment: .leading , spacing: 16 ) {
                
                Text("Hello Learner")
                    .font(.system(size: 34, weight: .bold, design: .default))
                
                
                Text("This app will help you learn everyday!")
                    .font(.body)
                    .foregroundColor(.secondary)
                
                Text("I want to learn ")
                
                TextField("Swift", text: .constant(""))
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 393, height: 48)
                    .padding()
                Text("I want to learn it in a")
                
                HStack(spacing: 16) {
                    ForEach(["Week", "Month", "Year"], id: \.self) { duration in
                        Button(duration) {
                            selectedDuration = duration
                        }
                        .frame(width: 97, height: 48)
                        .background(selectedDuration == duration ? Color.hOrange : Color.hGray.opacity(0.1))
                        .foregroundColor(.white)
                        .cornerRadius(30)
                        .glassEffect()
                    }
                }
            }
                Spacer()
                
                    .padding()
                
                Button ("Start learning"){}
                    .frame(width: 182, height: 48)
                    .background(Color.hOrange)
                    .foregroundColor(.white)
                    .cornerRadius(30)
                    .glassEffect()
                
                
            }
        }
    }

            

#Preview {
    ContentView()
}
