//
//  Update Learning goal.swift
//  HelloWorld
//
//  Created by Eatzaz Hafiz on 26/10/2025.
//

import SwiftUI

struct UpdateLearningGgoal: View {
    @State private var goal = ""
    @State private var selectedDuration: String = "Week"
    
    var body: some View {
        NavigationView{
        VStack(alignment: .leading) {
                
                Text("I want to learn ")
                    .font(Font.system(size: 22, weight: .regular, design: .default))
                
                TextField("Swift", text: $goal)
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
                        .glassEffect(.clear)
                    }
                }
                
                Spacer()
                
            }//v
            
            
        .toolbar {
            ToolbarSpacer()
                    ToolbarItem(placement: .principal){

                        Text("Learning Goal")
                            .font(.system(size: 24))
                            
                        }
            ToolbarItem(placement: .navigationBarTrailing){
                
                Image(systemName: "checkmark")
                    .background(.orange)
                    .clipShape(Circle())
                    
            }
                    }
        }// NavigationView
    }
}

#Preview {
    UpdateLearningGgoal()
}
