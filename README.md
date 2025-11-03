# Learning Journey – iOS App

**Learning Journey** is an iOS app that helps you stay consistent with your learning goals.  
It lets you track your daily learning progress, build streaks, and take “freezes” (rest days) when needed — all through a clean and simple interface.

> ⚠️ The app is still under development, and more features will be added soon.
---

## 🧭 Table of Contents

- Overview
- Features
- Architecture
- Screens Overview
- Tech Stack
- Installation
- Future Improvements

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

The app is **not fully following MVVM yet**, but it’s designed with that structure in mind for future updates.  
Right now, most of the logic is handled directly within the SwiftUI views, and I plan to gradually refactor it into proper models and view models later on.

### Current Structure:
- SwiftUI views handle most of the logic and state management.
- Data is stored using `@AppStorage` and `@State` properties.
- Simple models are used for tracking user progress and freeze days.

### Planned Refactor (MVVM):
**Model (planned):**  
- `LearnerModel.swift`  
- `DayModel.swift`

**ViewModel (planned):**  
- `OnboardingViewModel.swift`  
- `ActivityViewModel.swift`  
- `CalendarModel.swift`

**View:**  
- `OnboardingView.swift`  
- `ActivityView.swift`  
- `CalendarView.swift`  
- `GoalCompletedView.swift`
- `UpdateLearningGgoalView.swift`

---

## 📱 Screens Overview

<p align="center">
  <img src="https://github.com/user-attachments/assets/6627be6b-9085-4bcf-b46c-2b93a8dc1b2e" width="250" />
  <img src="https://github.com/user-attachments/assets/539cc60a-e0f3-4075-b066-d3461fb04dc0" width="250" />
  <img src="https://github.com/user-attachments/assets/e3962454-e927-4d65-a93d-3a8b4f455197" width="250" />
</p>

---

## 🧠 Tech Stack

- **Language:** Swift  
- **Frameworks:** SwiftUI, Foundation, Combine  
- **Architecture (in progress):** MVVM  
- **Data Storage:** UserDefaults + Codable  
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
