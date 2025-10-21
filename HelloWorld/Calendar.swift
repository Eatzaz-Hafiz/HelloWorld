////
////  calendar.swift
////  HelloWorld
////
////  Created by Eatzaz Hafiz on 21/10/2025.
////
//
//import SwiftUI
//
//struct CalendarWeekView: View {
//    private let calendar = Calendar.current //gives you the user’s current calendar (Gregorian for most users).
//    private let today = Date() //urrent date and time (right now).
//
//    // Weekday letters for display: ["S", "M", ..., "S"]
//    private let weekdaySymbols = Calendar.current.shortWeekdaySymbols
//
//    private var weekDates: [Date] {
//        // Start from Sunday of current week
//        let startOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: today))!
//        return (0..<7).compactMap { calendar.date(byAdding: .day, value: $0, to: startOfWeek) }
//    }
//
//    var body: some View {
//        VStack(alignment: .leading){
////            NavigationLink(destination: CalendarPawup()) {
//                HStack (spacing: -15){
//                    Text("Your Calendar")
//                        .font(.custom("GNF", size: 24))
//                        .fontWeight(.bold)
//                        .foregroundColor(.black)
//                        .padding(.horizontal, 20)
//                        .padding(.vertical, 15)
//                    
//                    Image("paly")
//                        .resizable()
//                        .frame(width: 28, height: 28)
//                        
//                }
////            }
//            HStack(spacing: 12) {
//                ForEach(Array(weekDates.enumerated()), id: \.element) { index, date in
//                    VStack(spacing: 6) {
//                        // Weekday letter above each cell
//                        Text(weekdayLetter(for: date))
//                            .font(.system(size: 16))
//                            .foregroundColor(.black)
//                        
//                        // Day content
//                        let day = calendar.component(.day, from: date)
//                        
////                        if let did = WorkoutStore.get(on: date) {
////                            DayCell(content: .image(did ? "Star" : "brokenheart"))
////                        } else if isPast(date) {
////                            DayCell(content: .image("brokenheart"))
////                        } else {
////                            DayCell(content: .number(day))
////                        }
//                    }
//                }
//            } .padding(.horizontal, 12)
//        }
//       
//    }
//
//    private func isPast(_ date: Date) -> Bool {
//        let today = calendar.startOfDay(for: Date())
//        let target = calendar.startOfDay(for: date)
//        return target < today
//    }
//
//    private func weekdayLetter(for date: Date) -> String {
//        let index = calendar.component(.weekday, from: date) - 1
//        // Make sure it's in bounds
//        return (0..<7).contains(index) ? String(weekdaySymbols[index].prefix(1)) : ""
//    }
//}
//
//#Preview {
//    CalendarWeekView()
//}
















import SwiftUI

struct CalendarWeekView: View {
    
    private let calendar = Calendar.current
    private let today = Date()
    private let weekdaySymbols = Calendar.current.shortWeekdaySymbols

    private var weekDates: [Date] {
        let startOfWeek = calendar.date(
            from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: today)
        )!
        return (0..<7).compactMap { calendar.date(byAdding: .day, value: $0, to: startOfWeek) }
    }
    
    private var monthYear: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: today)
    }
        
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 8) {
                Button ("\(monthYear)"){ }
                .foregroundColor(Color.white)
                
                
                Image(systemName: "calendar")
            }

            HStack(spacing: 12) {
                ForEach(weekDates, id: \.self) { date in
                    VStack(spacing: 8) {
                        // Weekday (above circle)
                        Text(weekdayLetter(for: date))
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.gray)

                        // Day number (inside circle)
                        Text("\(calendar.component(.day, from: date))")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 44, height: 44)
                            .background(Color.orange)
                            .cornerRadius(22)
                    }
                }
            }
        }
        .padding()
    }

    private func weekdayLetter(for date: Date) -> String {
        let index = calendar.component(.weekday, from: date) - 1
        return String(weekdaySymbols[index].prefix(3).uppercased())
    }
}

#Preview {
    CalendarWeekView()
}
