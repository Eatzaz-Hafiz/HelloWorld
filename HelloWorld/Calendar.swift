//
//  Calendar.swift
//  HelloWorld
//
//  Created by Eatzaz Hafiz on 21/10/2025.
//

import SwiftUI

// MARK: - CalendarWeek (Main week display)
struct CalendarWeek: View {
    @State private var currentWeekStart: Date = Calendar.current.startOfWeek(for: Date())
    @State private var showFullCalendar = false
    @State private var selectedDate = Date()
    var learnedDates: [String]
    var freezedDates: [String]
    
    private let calendar = Calendar.current
    private let weekdaySymbols = Calendar.current.shortWeekdaySymbols

    private var weekDates: [Date] {
        (0..<7).compactMap { calendar.date(byAdding: .day, value: $0, to: currentWeekStart) }
    }

    private var monthYear: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: currentWeekStart)
    }
    
    var body: some View {
        
        NavigationStack {
            
        VStack(alignment: .leading, spacing: 16) {
            
            // MARK: Header
            HStack {
              
                Button {
                        withAnimation {
                            showFullCalendar.toggle()
                        }
                    } label: {
                        HStack {
                            Text(monthYear)
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.orange)
                                .font(.system(size: 15))
                                .rotationEffect(.degrees(showFullCalendar ? 90 : 0))
                        }
                    }
                
                Spacer()
                
                Button(action: { changeWeek(by: -1) }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.orange)
                        .font(.system(size: 20))
                }
                
                Button(action: { changeWeek(by: 1) }) {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.orange)
                        .font(.system(size: 20))
                }
            }// H for monthYear and left, right chevron
            
            if showFullCalendar {
                MonthYearPicker(selectedDate: $selectedDate)
                    .frame(height: 150)
                    .transition(.opacity.combined(with: .move(edge: .top)))
                    .onChange(of: selectedDate) { newDate in
                        let components = Calendar.current.dateComponents([.year, .month], from: newDate)
                        if let firstOfMonth = Calendar.current.date(from: components) {
                            currentWeekStart = Calendar.current.startOfWeek(for: firstOfMonth)
                        }
                        withAnimation {
                            showFullCalendar = false
                        }
                    }
            }
            
            // MARK: Week days
            HStack(spacing: 5) {
                ForEach(weekDates, id: \.self) { date in
                    VStack(spacing: 8) {
                        Text(weekdayLetter(for: date))
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.gray)
                        
                        Text("\(calendar.component(.day, from: date))")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 44, height: 44)
                            .background(colorForDate(date))
                            .cornerRadius(22)
                    }
                }
            }
        }
        .padding()
        .animation(.easeInOut(duration: 0.25), value: currentWeekStart)
        
        }
    }// body
    
    // MARK: - Helpers
    private func weekdayLetter(for date: Date) -> String {
        let index = calendar.component(.weekday, from: date) - 1
        return String(weekdaySymbols[index].prefix(3).uppercased())
    }
    
    private func isToday(_ date: Date) -> Bool {
        calendar.isDateInToday(date)
    }

    private func colorForDate(_ date: Date) -> Color {
        let dateString = formattedDate(date)

        if isToday(date) {
            return .orange // today
        }
        else if learnedDates.contains(dateString) {
            return Color.orange.opacity(0.3) // learned
        }
        else if freezedDates.contains(dateString) {
            return .darkBlue1 // freezed
        }
        else {
            return .clear // other days
        }
    }
    
    private func textColor(for date: Date) -> Color {
        let dateString = formattedDate(date)
        
        if isToday(date) {
            return .white // today
        }
        else if learnedDates.contains(dateString) {
            return .orange // learned
        }
        else if freezedDates.contains(dateString) {
            return.blue // freezed
        }
        else {
            return .orange
        }
    }
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
    
    
    private func changeWeek(by offset: Int) {
        if let newWeek = calendar.date(byAdding: .weekOfYear, value: offset, to: currentWeekStart) {
            currentWeekStart = newWeek
        }
    }

    private func goToTodayWeek() {
        currentWeekStart = calendar.startOfWeek(for: Date())
    }
}

extension Calendar {
    func startOfWeek(for date: Date) -> Date {
        let components = dateComponents([.yearForWeekOfYear, .weekOfYear], from: date)
        return self.date(from: components)!
    }
}




#Preview {
    CalendarWeek(learnedDates: [], freezedDates: []).preferredColorScheme(.dark)
}

// MARK: - Scrolling Calendar

struct ScrollingCalendarView: View {
    @StateObject private var viewModel = CalendarViewModel()
    @Environment(\.presentationMode) private var presentationMode

    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    ForEach(Array(viewModel.months.enumerated()), id: \.offset) { (_, monthStart) in
                        CalendarMonthView(viewModel: viewModel, monthStart: monthStart)
                            .frame(width: 338)

                        Spacer().frame(height: 8)

                        Rectangle()
                            .frame(height: 0.5)
                            .padding(.horizontal, 28)
                            .foregroundStyle(Color.gray)

                        Spacer().frame(height: 24)
                    }
                }.padding(.top, 17.9)
            }
            .navigationTitle("All activities")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { presentationMode.wrappedValue.dismiss() }) {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.white)
                    }
                }
            }
        }
    }
}

// MARK: - Calendar Month View
struct CalendarMonthView: View {
    let viewModel: CalendarViewModel
    let monthStart: Date

    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.formattedMonth(from: monthStart))
                .font(.system(size: 17, weight: .semibold))
            
            Spacer().frame(height: 8)
            
            CalendarWeekHeaderView(weekDays: viewModel.weekDaySymbols())

            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 10) {
                ForEach(viewModel.daysInMonth(from: monthStart), id: \.self) { date in
                    CalendarDayView(viewModel: viewModel, date: date)
                }
            }
        }
    }
}

struct CalendarWeekHeaderView: View {
    let weekDays: [String]

    var body: some View {
        HStack {
            ForEach(weekDays, id: \.self) { day in
                Text(day)
                    .font(.system(size: 13, weight: .semibold))
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct CalendarDayView: View {
    let viewModel: CalendarViewModel
    let date: Date

    var body: some View {
        if viewModel.isPlaceholder(date) {
            Text("")
                .frame(maxWidth: .infinity)
        } else {
            ZStack {
                Circle()
                    .frame(width: 40, height: 40)
                    .foregroundStyle(Color.orange.opacity(0.2))

                Text("\(viewModel.dayNumber(from: date))")
                    .font(.system(size: 24, weight: .medium))
                    .foregroundStyle(Color.orange)
                    .padding(1)
            }
        }
    }
}



struct MonthYearPicker: View {
    @Binding var selectedDate: Date
    
    private let calendar = Calendar.current
    private let months = Calendar.current.monthSymbols
    private let years: [Int] = Array(1900...2100)
    
    var body: some View {
        HStack(spacing: 16) {
            // Month wheel
            Picker("Month", selection: Binding(
                get: {
                    calendar.component(.month, from: selectedDate) - 1
                },
                set: { monthIndex in
                    updateDate(month: monthIndex + 1,
                               year: calendar.component(.year, from: selectedDate))
                }
            )) {
                ForEach(0..<months.count, id: \.self) { i in
                    Text(months[i]).tag(i)
                }
            }
            .frame(maxWidth: .infinity)
            .clipped()
            .labelsHidden()
            
            // Year wheel
            Picker("Year", selection: Binding(
                get: {
                    calendar.component(.year, from: selectedDate)
                },
                set: { year in
                    updateDate(month: calendar.component(.month, from: selectedDate),
                               year: year)
                }
            )) {
                ForEach(years, id: \.self) { year in
                    Text(String(format: "%d", year))
                        .tag(year)
                }
            }
            .frame(maxWidth: .infinity)
            .clipped()
            .labelsHidden()
        }
        .pickerStyle(.wheel)
    }// body
    
    private func updateDate(month: Int, year: Int) {
        if let newDate = calendar.date(from: DateComponents(year: year, month: month)) {
            selectedDate = newDate
        }
    }
}

