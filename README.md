# InstantMechanic
InstantMechanic is a SwiftUI iOS application that allows users to browse nearby mechanics and submit service requests.

##Demo

## ScreenShot

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
