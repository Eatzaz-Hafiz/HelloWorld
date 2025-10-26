//
//  GoalComplete.swift
//  HelloWorld
//
//  Created by Eatzaz Hafiz on 26/10/2025.
//

import SwiftUI

struct GoalCompleted: View {

    @AppStorage("daysLearned") private var daysLearned: Int = 0
    @AppStorage("daysFreezed") private var daysFreezed: Int = 0
    @AppStorage("lastCheckedDate") private var lastCheckedDate: String = ""
    @AppStorage("lastFreezedWeek") private var lastFreezedWeek: String = ""
    @AppStorage("lastFreezedDate") private var lastFreezedDate: String = ""
    @AppStorage("weeklyFreezeCount") private var weeklyFreezeCount: Int = 0
    @State private var isFreezedToday : Bool = false
    @Binding var goal : String  //gets the binding from parent
    @AppStorage("learnedDates") private var learnedDatesString: String = ""
    @AppStorage("freezedDates") private var freezedDatesString: String = ""
    
    var body: some View {
    
              
                NavigationStack{
                    VStack (spacing: 24){
                        ZStack{
                            RoundedRectangle(cornerRadius: 12)
                                .strokeBorder(.ultraThinMaterial,lineWidth: 2)
                                .frame(width: 365, height: 254)
                            
                            VStack( spacing: 12){
                                
                                CalendarWeek(learnedDates: learnedDates, freezedDates: freezedDates)
                                .frame(maxWidth: .infinity)
                                .frame(width: 333, height: 78)
                                .padding()
                                
                                
                                    Text("Today is:")
                                    .font(.system(size: 16))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(6)
                                
        //                        Text("\(goal)")
                                
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
                                            .foregroundColor(Color.lightBlue)
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
                                .padding()
                                
                            }//v for the calender and stuff
                            
                            .padding()
                            
                        }//z for calender and stuff
                        
                        Image(systemName: "hands.clap.fill")
                            .foregroundColor(Color.orange)
                            .font(.system(size: 40))
                        
                        Text("Will done!")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                        
                        Text("Goal completed! start learning again or set new learning goal")
                            .frame(width: 338, height: 56)
                            .font(Font.system(size: 16))
                            .foregroundColor(.gray)

                       
                        Spacer()
                        
                        Button(action: addFreezOncePerWeek ){
                            Text("Set new learning goal")
                            
                        }//Set new learning goal button
                        .disabled(!canAddFreezedToday || alreadyUsedToday)
                        .frame(width: 274, height: 48)
                        .foregroundColor(.white)
                        .background(Color.hOrange)
                        .cornerRadius(30)
                        .glassEffect()
                        
                        Text("Set same learning goal and duration")
                            .font(Font.system(size: 14))
                            .foregroundColor(.orange)
                        
                    }//v for the whole interface
                    .navigationTitle("Activity")
                    .toolbarTitleDisplayMode(.inlineLarge)
                    .toolbar{
                        ToolbarItem(){
                            NavigationLink(destination: ScrollingCalendarView(learnedDates: learnedDates, freezedDates: freezedDates)){
                                        Label("Calendar", systemImage: "calendar")
                                    }//calender Button
                        }//toolbaritem
                        ToolbarSpacer()
                        
                        ToolbarItem(){
                            NavigationLink(destination: ContentView()) {
                                        Label("Edit", systemImage: "pencil.and.outline")
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
            private var canAddFreezedToday: Bool {
                let today = formattedDate(Date())
                return lastFreezedWeek  != today && weeklyFreezeCount < 2
            }
            
            
            // learned days counter function
            private func addDayOncePerDay() {
                let today = formattedDate(Date())
                if !alreadyUsedToday {
                    daysLearned += 1
                    lastCheckedDate = today
                    learnedDatesString += (learnedDatesString.isEmpty ? "" : ",") + today
                }
            }
            
            private func formattedDate(_ date: Date) -> String {
                    let formatter = DateFormatter()
                    formatter.dateFormat = "yyyy-MM-dd"
                    return formatter.string(from: date)
                }
            
            private func formattedWeek(_ date: Date) -> String {
                let calendar = Calendar.current
                let components = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: date)
                return "\(components.yearForWeekOfYear!)-W\(components.weekOfYear!)"
            }
            
            private func addFreezOncePerWeek() {
                let currentWeek = formattedWeek(Date())
                let today = formattedDate(Date())
                
                if lastFreezedWeek != currentWeek {
                        weeklyFreezeCount = 0
                    lastFreezedWeek = currentWeek
                    freezedDatesString += (freezedDatesString.isEmpty ? "" : ",") + today
                }
                
                if weeklyFreezeCount < 2 && !alreadyUsedToday     {
                    daysFreezed += 1
                    weeklyFreezeCount += 1
                    lastFreezedDate = today
                    isFreezedToday = true
                }
                else {
                    daysFreezed += 0
                }
            }
            
            private var alreadyUsedToday: Bool {
                let today = formattedDate(Date())
                return lastCheckedDate == today || lastFreezedDate == today
            }
            
            
            private var learnedDates: [String] {
                learnedDatesString
                    .split(separator: ",")
                    .map { String($0) }
            }

            private var freezedDates: [String] {
                freezedDatesString
                    .split(separator: ",")
                    .map { String($0) }
            }
            
            
            
       


        
        
        
    
}

#Preview {
    GoalCompleted(goal: .constant(""))
}
