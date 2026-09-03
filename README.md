# InstantMechanic
InstantMechanic is a SwiftUI iOS application that allows users to browse nearby mechanics and submit service requests.

##Demo

## ScreenShot
<img width="250" height="400" alt="Simulator Screenshot - iPhone 17 Pro - 2026-09-03 at 08 28 51" src="https://github.com/user-attachments/assets/fe38d431-7bac-4efb-84ff-178a29074921" />

<img width="250" height="400" alt="Simulator Screenshot - iPhone 17 Pro - 2026-09-03 at 08 29 21" src="https://github.com/user-attachments/assets/5a05e744-2b48-43ac-969d-91675d76b021" />


<img width="250" height="400" alt="Simulator Screenshot - iPhone 17 Pro - 2026-09-03 at 08 29 12" src="https://github.com/user-attachments/assets/c993af24-21a0-4b15-8899-40d5ee6e117b" />
<img width="250" height="400" alt="Simulator Screenshot - iPhone 17 Pro - 2026-09-03 at 08 31 09" src="https://github.com/user-attachments/assets/839c333a-2072-4379-8f12-8cbe40ba5da0" />



<img width="250" height="400" alt="Simulator Screenshot - iPhone 17 Pro - 2026-09-03 at 08 33 58" src="https://github.com/user-attachments/assets/eaacecf6-9e3d-4c23-b10d-f258541eb9ae" />

<img width="250" height="400" alt="Simulator Screenshot - iPhone 17 Pro - 2026-09-03 at 08 34 17" src="https://github.com/user-attachments/assets/42836f21-a5e7-4d09-8143-6c9e889a004e" />

<img width="250" height="400" alt="Simulator Screenshot - iPhone 17 Pro - 2026-09-03 at 08 32 14" src="https://github.com/user-attachments/assets/5fd4b53a-96b6-4bc8-8de5-f6ae51e26394" />

<img width="250" height="400" alt="Simulator Screenshot - iPhone 17 Pro - 2026-09-03 at 08 32 52" src="https://github.com/user-attachments/assets/d8ff8b22-f6ff-4a83-8b7e-963c7d9d8c02" />


## Features

- Browse a list of mechanics
- View mechanic name, rating, distance, location, services, and Open/Closed status
- View mechanic details, including working hours and phone number
- Submit a mechanic service request
- View and delete submitted requests
- Search mechanics by name, location, or service
- Filter mechanics by service and open status
- Pull to refresh mechanic data
- Light and dark mode support

## How to Run

1. Clone or download this repository.
2. Open `InstantMechanic.xcodeproj` in Xcode.
3. Select an iPhone Simulator.
4. Press Run.

## Architecture

The project follows a simple MVVM architecture:

- **Models**: `Mechanic` and `ServiceRequest`
- **Views**: SwiftUI screens and reusable row views
- **ViewModels**: `MechanicViewModel` and `RequestViewModel`
- **Services**: `APIService` loads and decodes mechanic data

## Data Source

The app uses local mock JSON data from `mechanics.json`.

The JSON is decoded into `Mechanic` model objects and displayed in the SwiftUI interface. This approach simulates data returned from an API endpoint.

## Assumptions

- Service requests are stored only while the app is running.
- Mechanic data is mock data for demonstration purposes.
- A production version would use a real backend API and persistent request storage.

## AI Assistance

AI tools were used to assist with SwiftUI implementation, feature ideas, code explanations, and debugging. All code was reviewed and understood before inclusion.

## Future Improvements

- Connect to a real REST API
- Save requests using a backend or local persistence
- Add user authentication
- Add mechanic booking time slots
- Add unit tests
- Improve accessibility and localization
