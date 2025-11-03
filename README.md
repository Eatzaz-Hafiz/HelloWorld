# Learning Journey – iOS App

**Learning Journey** is an iOS app that helps you stay consistent with your learning goals.  
It lets you track your daily learning progress, build streaks, and take “freezes” (rest days) when needed — all through a clean and simple interface.

> ⚠️ The app is still under development, and more features will be added soon.
---

## 🧭 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Architecture](#architecture)
- [Screens Overview](#screens-overview)
- [Tech Stack](#tech-stack)
- [Installation](#installation)
- [Future Improvements](#future-improvements)

---

## 🌟 Overview

**Learning Journey** makes it easier (and more fun) to keep learning every day.  
You can set a goal, track your streak, and use freeze days when you need a short break without losing your progress.

Currently in progress:
- Persistent data storage, so your progress stays saved even after closing the app.

---
## ✨ Features

- 🧑‍🎓 **Onboarding** – Set your learning goal and choose how long you want to stay consistent (week, month, or year).  
- 🔥 **Activity Tracking** – Log your learning days and build your streak.  
- ❄️ **Freeze Mode** – Take rest days without breaking your streak.  
- 🗓️ **Calendar View** – See your learning and freeze days visually on a simple calendar.  

In progress:  
💾 **Persistence** – Save user data locally using `UserDefaults` and `Codable`.

---

## 🧩 Architecture

The app follows the **MVVM (Model–View–ViewModel)** structure for clean and organized code.

**Model:**  
- `LearnerModel.swift`  
- `DayModel.swift`

**ViewModel:**  
- `OnboardingViewModel.swift`  
- `ActivityViewModel.swift`  
- `CalendarModel.swift`

**View:**  
- `OnboardingView.swift`  
- `ActivityView.swift`  
- `CalendarView.swift`  
- `CompactCalendarView.swift`  
- `MonthlyCalendarView.swift`  
- `WeeklyCalendarView.swift`  
- `StreakFreezeView.swift`

---

## 📱 Screens Overview

- **Onboarding Screen:** Set your subject and goal duration.
- 
- **Activity Screen:** Track daily learning and view streak progress.  
- **Calendar Screen:** Visual representation of your learning and freeze days.

---

## 🧠 Tech Stack

- **Language:** Swift  
- **Frameworks:** SwiftUI, Foundation, Combine  
- **Architecture:** MVVM  
- **Data Storage (in progress):** UserDefaults + Codable  
- **Requirements:** iOS 17+ / Xcode 15+

---

## ⚙️ Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/Eatzaz-Hafiz/HelloWorld.git
2. Open the project in Xcode:
     open HelloWorld.xcodepr
3. Build and run on the simulator or a real device.

---

👩🏽‍💻 Author
Eatzaz Hafiz
iOS Developer | Computer Science Student
📍 Saudi Arabia
