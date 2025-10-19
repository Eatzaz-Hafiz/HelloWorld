//
//  Untitled.swift
//  HelloWorld
//
//  Created by Eatzaz Hafiz on 19/10/2025.
//
import SwiftUI

struct Main: View {
  
    var body: some View {
        NavigationStack{
            VStack{
                Button(action:{}){
                   Text("Log as Learned")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(.white)
                }//logged Button
                
                .frame(width: 274, height: 274)
                .background(Color.hOrange)
                .clipShape(Circle())
                .glassEffect()

                Spacer()
                Button("Log as Freezed"){
                    
                }//freezed button
                .frame(width: 274, height: 48)
                .foregroundColor(.white)
                .background(Color.hbule)
                .cornerRadius(30)
                .glassEffect()
                
                Text("1 out of 2 Freezes used ")
                    .font(Font.system(size: 14))
                    .foregroundColor(.gray)
                
            }//v
            .navigationTitle("Activity")
            .toolbarTitleDisplayMode(.inlineLarge)
            .toolbar{
                ToolbarItem(){
                    Button("Calender",systemImage: "calendar"){
                        
                    }//calender
                }//toolbaritem
                ToolbarSpacer()
                
                ToolbarItem(){
                    Button("Calender",systemImage: "pencil.and.outline"){
                        
                    }//Editer
                    
                }//toolbaritem
                
                
            }//toobar
        }//navigationstack
        
    }
}
#Preview{
    Main()
}

