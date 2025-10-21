//
//  Untitled.swift
//  HelloWorld
//
//  Created by Eatzaz Hafiz on 19/10/2025.
//
import SwiftUI

struct Main: View {
    @AppStorage("daysLearned") private var daysLearned: Int = 0
    @AppStorage("daysFreezed") private var daysFreezed: Int = 0
    @AppStorage("lastCheckedDate") private var lastCheckedDate: String = ""
//    @State private var isSelected: Bool  = false
    @Binding var goal : String  //gets the binding from parent
//    @State private var isOn: Bool = false
  
    var body: some View {
        NavigationStack{
            VStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 12)
                        .strokeBorder(.ultraThinMaterial,lineWidth: 2)
                        .frame(width: 365, height: 254)
                    VStack{
                        Text("\(goal)")
                        HStack(alignment: .center, spacing: 13){
                            
                            HStack{
                               
                                Image(systemName: "flame.fill")
                                    .foregroundColor(Color.orange)
                                    .font(.system(size: 20))
                                VStack(alignment: .leading){
                                    Text("\(daysLearned)")
                                        .font(.system(size: 24, weight: .semibold))
                                        .foregroundColor(.white)
                                    Text(" Days Learned")
                                        .font(.system(size: 12))
                                        .foregroundColor(.white)
                                }// v for Learned days viewer
                                
                            }//H for Learned days viewer
                            .frame(width: 160, height: 69)
                            .background(Color.orange.opacity(0.3))
                            .clipShape(Capsule())
                            
                            
                            HStack{
                                Image(systemName: "cube.fill")
                                    .foregroundColor(Color.l)
                                    .font(.system(size: 20))
                                VStack(alignment: .leading){
                                    Text("\(daysFreezed)")
                                        .font(.system(size: 24, weight: .semibold))
                                        .foregroundColor(.white)
                                    Text(" Days Freezed")
                                        .font(.system(size: 12))
                                        .foregroundColor(.white)
                                }// v for freezed days viewer
                                
                            }//H v for freezed days viewer
                            .frame(width: 160, height: 69)
                            .background(Color.darkBlue1)
                            .clipShape(Capsule())
                            
                            
                        }//H for c and Day Freezed
                        .frame(maxWidth: .infinity)
                        .frame(width: 333, height: 69)
                        
                        
                    }//v for the calender and stuff
                    
                    .padding()
                    
                }//z for calender and stuff
                
                
                //logged Button
                Button(action: addDayOncePerDay ){
                    
                    Text(canAddToday ? "Log as Learned" :"Learned Today")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(canAddToday ? .white : .orange)
                }//Log as Learned button
                .disabled(!canAddToday)
                .padding()
                .frame(width: 274, height: 274)
                .background(canAddToday ? Color.hOrange : Color.logo)
                .foregroundColor(Color.orange)
//                .background(Color.hOrange )
                .clipShape(Circle())
                
                .glassEffect(.clear)

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
                        
                    }//calender Button
                }//toolbaritem
                ToolbarSpacer()
                
                ToolbarItem(){
                    Button("Calender",systemImage: "pencil.and.outline"){
                        
                    }//Edit Button
                    
                }//toolbaritem
                
                
            }//v
                
                
        }//navigationstack
        
    }//body
    
    
    //check if the user can click today
    private var canAddToday: Bool {
        let today = formattedDate(Date())
        return lastCheckedDate != today
    }
    
    // learned days counter function
    private func addDayOncePerDay() {
        let today = formattedDate(Date())
        if lastCheckedDate != today {
            daysLearned += 1
            lastCheckedDate = today
        }
    }
    
    private func formattedDate(_ date: Date) -> String {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            return formatter.string(from: date)
        }
    
}
#Preview{
    Main(goal: .constant(""))
}

