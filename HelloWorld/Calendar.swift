////
////  calendar.swift
////  HelloWorld
////
////  Created by Eatzaz Hafiz on 21/10/2025.
////
//



import SwiftUI

struct CalendarWeek: View {
    
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
            HStack {
                Button ("\(monthYear)"){ }
                    .font(.system(size: 20))
                .foregroundColor(Color.white)
                
                Image(systemName: "chevron.right")
                    .foregroundColor(Color.orange)
                    .font(.system(size: 15))
                
                Spacer()
                
                Button("",systemImage: "chevron.left"){ }
                    .foregroundColor(Color.orange)
                    .font(.system(size: 20))
                
                Button("",systemImage: "chevron.right"){ }
                    .foregroundColor(Color.orange)
                    .font(.system(size: 20))
                                
            }

            HStack(spacing: 5) {
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
    CalendarWeek()
}













//
//import SwiftUI
//
//struct CalendarWeek: View {
//    
//    private let calendar = Calendar.current
//    private let today = Date()
//    private let weekdaySymbols = Calendar.current.shortWeekdaySymbols
//
//    @State private var showFullCalendar = false
//    
//    private var weekDates: [Date] {
//        let startOfWeek = calendar.date(
//            from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: today)
//        )!
//        return (0..<7).compactMap { calendar.date(byAdding: .day, value: $0, to: startOfWeek) }
//    }
//    
//    private var monthYear: String {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "MMMM yyyy"
//        return formatter.string(from: today)
//    }
//        
//    var body: some View {
//        VStack(alignment: .leading, spacing: 16) {
//            
//            // Month title + toggle
//            HStack(spacing: 8) {
//                Button {
//                    withAnimation(.spring()) {
//                        showFullCalendar.toggle()
//                    }
//                } label: {
//                    HStack {
//                        Text(monthYear)
//                            .font(.system(size: 20, weight: .bold))
//                            .foregroundColor(.white)
//                        Image(systemName: showFullCalendar ? "chevron.right" : "chevron.right")
//                            .foregroundColor(.white)
//                            .font(.system(size: 14))
//                    }
//                }
//            }
//
//            // One-week calendar (always visible)
//            HStack(spacing: 5) {
//                ForEach(weekDates, id: \.self) { date in
//                    VStack(spacing: 8) {
//                        Text(weekdayLetter(for: date))
//                            .font(.system(size: 14, weight: .bold))
//                            .foregroundColor(.gray)
//                        Text("\(calendar.component(.day, from: date))")
//                            .font(.headline)
//                            .foregroundColor(.white)
//                            .frame(width: 44, height: 44)
//                            .background(Color.orange)
//                            .cornerRadius(22)
//                    }
//                }
//            }
//            
//            // Full calendar (shows only when button clicked)
////            if showFullCalendar {
////                FullCalendarView(today: today)
////                    .transition(.opacity.combined(with: .slide))
////            }
//        }
//        .padding()
//        .background(Color.black)
//    }
//
//    private func weekdayLetter(for date: Date) -> String {
//        let index = calendar.component(.weekday, from: date) - 1
//        return String(weekdaySymbols[index].prefix(3).uppercased())
//    }
//}
//
//// MARK: - Full Calendar View (inside same file)
////struct FullCalendarView: View {
////    let today: Date
////    private let calendar = Calendar.current
////    
////    private var startOfMonth: Date {
////        calendar.date(from: calendar.dateComponents([.year, .month], from: today))!
////    }
////    
////    private var daysInMonth: [Date] {
////        guard let range = calendar.range(of: .day, in: .month, for: today) else { return [] }
////        return range.compactMap { day in
////            calendar.date(byAdding: .day, value: day - 1, to: startOfMonth)
////        }
////    }
////    
////    private var weeks: [[Date]] {
////        stride(from: 0, to: daysInMonth.count, by: 7).map {
////            Array(daysInMonth.dropFirst($0).prefix(7))
////        }
////    }
////    
////    var body: some View {
////        VStack(spacing: 8) {
////            ForEach(weeks, id: \.self) { week in
////                HStack(spacing: 5) {
////                    ForEach(week, id: \.self) { date in
////                        Text("\(calendar.component(.day, from: date))")
////                            .font(.subheadline)
////                            .foregroundColor(.white)
////                            .frame(width: 35, height: 35)
////                            .background(calendar.isDateInToday(date) ? Color.orange : Color.gray.opacity(0.4))
////                            .cornerRadius(18)
////                    }
////                }
////            }
////        }
////        .padding(.top, 8)
////    }
////}
//
//#Preview {
//    CalendarWeek()
//}
