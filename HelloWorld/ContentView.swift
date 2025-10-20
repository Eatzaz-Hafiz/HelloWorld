//
//  ContentView.swift
//  HelloWorld
//
//  Created by Eatzaz Hafiz on 16/10/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var goal = ""
    @State private var selectedDuration: String = "Week"
    
    var body: some View {
        
        
            
            VStack(alignment: .leading){
                
                
                //z
                ZStack{
                    Image(systemName: "flame.fill")
                        .font(.system(size: 43))
                        .foregroundColor(Color.orange)
                        .frame(width: 109, height: 109)
                        .background(Color.logo)
                        .clipShape(Circle())
                        .glassEffect()
                }
                .frame(maxWidth: .infinity)

                VStack(alignment: .leading, spacing: 16 ) {
                    
                    Text("Hello Learner")
                        .font(.system(size: 34, weight: .bold, design: .default))
                    
                    
                
                    Text("This app will help you learn everyday!")
                        .font(Font.system(size: 17, weight: .regular, design: .default))
                        .foregroundColor(.secondary)
                    
                    Text("I want to learn ")
                        .font(Font.system(size: 22, weight: .regular, design: .default))
                    
                    
                    TextField("Swift", text: .constant(""))
                        .textFieldStyle(.roundedBorder)
                        
                        .frame(width: 393, height: 48)
                        
                        
                    
                    Text("I want to learn it in a")
                        .font(Font.system(size: 22, weight: .regular, design: .default))
                        

                    HStack(spacing: 16) {
                        ForEach(["Week", "Month", "Year"], id: \.self) { duration in
                            Button(duration) {
                                selectedDuration = duration
                            }
                            .frame(width: 97, height: 48)
                            .background(selectedDuration == duration ? Color.hOrange : Color.hGray.opacity(0.1))
                            .foregroundColor(.white)
                            .cornerRadius(30)
                            .glassEffect(.clear.interactive())
                        }
                    }
                    
                    
                }//v
                
                
                
                
                Spacer()
                  
                VStack{
                    Button ("Start learning"){}
                        .frame(width: 182, height: 48)
                        .background(Color.hOrange)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                        .glassEffect(.clear)
                }//v
                .frame(maxWidth: .infinity)
                
                
                
               
            }//v
            .padding()
            
            
     
        }
    }

            

#Preview {
    ContentView()
}
