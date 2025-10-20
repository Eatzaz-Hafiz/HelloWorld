//
//  Untitled.swift
//  HelloWorld
//
//  Created by Eatzaz Hafiz on 19/10/2025.
//
import SwiftUI

struct Main: View {
    @State private var daysLearned: Int = 0
    @State private var daysFreezed: Int = 0
    @State private var isOn: Bool = false
  
    var body: some View {
        NavigationStack{
            VStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 12)
                        .strokeBorder(.ultraThinMaterial,lineWidth: 2)
                        .frame(width: 365, height: 254)
                    VStack{
                        HStack(alignment: .center, spacing: 13){
                            
                            HStack{
                                Image(systemName: "flame.fill")
                                    .foregroundColor(Color.red)
                                    .font(.system(size: 20))
                                VStack{
                                    Text("/*\(daysLearned)*/")
                                        .font(.system(size: 24, weight: .semibold))
                                        .foregroundColor(.white)
                                    Text(" Days Learned")
                                        .font(.system(size: 12))
                                        .foregroundColor(.white)
                                }
                                
                            }//H for Days Learned
                            .frame(width: 160, height: 69)
                            .background(Color.darkOrange)
                            .clipShape(Capsule())
                            .glassEffect()
                            
                            
                            HStack{
                                Image(systemName: "flame.fill")
                                    .foregroundColor(Color.red)
                                    .font(.system(size: 20))
                                VStack{
                                    Text("/*\(daysLearned)*/")
                                        .font(.system(size: 24, weight: .semibold))
                                        .foregroundColor(.white)
                                    Text(" Days Freezed")
                                        .font(.system(size: 12))
                                        .foregroundColor(.white)
                                }
                                
                            }//H for Days Freezed
                            .frame(width: 160, height: 69)
                            .background(Color.darkBlue1)
                            .clipShape(Capsule())
                            .glassEffect()
                            
                            
                            
                            
                        }//H for c and Day Freezed
                        .frame(maxWidth: .infinity)
                        .frame(width: 333, height: 69)
                        
                        
                    }//z for calender and stuff
                    .padding()
                    
                }
                
                
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
                
            }//v for the whole interface
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
                
                
            }//v
                
                
                
                
        }//navigationstack
        
    }//body
}
#Preview{
    Main()
}

