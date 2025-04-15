# **App Name**: FlexAI Companion

## Core Features:

- Home Page UI: Implement the Home Page UI with a welcoming title, horizontal cards for key features (Meal Planning, Today’s Workout, Track Progress), and an 'Today’s Overview' section with stat cards (Steps, Calories, Water).
- Bottom Navigation Bar: Design and implement the bottom navigation bar with Home, Meals, Workouts, Progress, and Community icons. The FlexAI button should be a prominent, circular, raised button in Champagne Gold.
- FlexAI Page UI: Build the FlexAI Page with a chat-style layout, a text input box, and a greeting message from FlexAI, along with placeholder messages.
- Personalized Wellness Insights: Integrate FlexAI to provide personalized wellness insights and recommendations based on user data. The AI will act as a tool to provide helpful advice for the user in order to thrive.

## Style Guidelines:

- Primary colors: Deep Teal #014D4E, Dark Emerald Green #046A38, Matte Black #1C1C1C for a luxurious feel.
- Accent colors: Champagne Gold #D4AF37, Muted Rose Gold #B76E79, Platinum Silver #E5E4E2 for highlights and interactive elements.
- Backgrounds: Rich Charcoal Gray #2C2C2C, Off-White #F8F8F8 to provide contrast and a clean look.
- Accent: Use Muted Rose Gold (#B76E79) for subtle highlights and interactive elements.
- Card-based layout with rounded corners (2xl), smooth shadows, and consistent padding/spacing for a clean and modern aesthetic.
- Use minimalist icons with a focus on clarity and premium design. Ensure icons are consistent across the app.

## Original User Request:
Build the frontend UI for a premium fitness and wellness mobile app called Flexcorex, using Flutter. The app should follow a sleek and luxurious design system using this color palette:

Primary Colors: Deep Teal #014D4E, Dark Emerald Green #046A38, Matte Black #1C1C1C

Accent Colors: Champagne Gold #D4AF37, Muted Rose Gold #B76E79, Platinum Silver #E5E4E2

Backgrounds: Rich Charcoal Gray #2C2C2C, Off-White #F8F8F8

Design Goals:

Modern, clean, premium aesthetic

Rounded corners (2xl), smooth shadows, card-based layout

Grid-based, not cluttered

Consistent padding and spacing

Pages to build:

Home Page UI

Title: “Welcome Back, [User's Name]”

A horizontal row of cards for:

Meal Planning

Today’s Workout

Track Progress

Section titled “Today’s Overview” with 3 small stat cards:

Steps Taken

Calories Burned

Water Intake

Bottom Navigation Bar (6 items):

Home, Meals, Workouts, FlexAI (center circle button), Progress, Community

FlexAI button should be larger, circular, slightly raised, and in Champagne Gold

FlexAI Page

Chat-style layout

Text input box at bottom

“Hi, I’m FlexAI. How can I help you thrive today?” greeting

Placeholder messages

Notes:

All UI should be built using Flutter widgets and follow modular clean architecture (separate widgets, services, and screens in organized folders).

Use dummy data and mock assets/images for now.

Do NOT include backend or logic — just pure UI.

All widgets should support both light and dark themes.

Folder structure (inside lib/):

markdown
Copy
Edit
- pages/
  - home_page.dart
  - flexai_page.dart
- widgets/
  - bottom_nav.dart
  - stat_card.dart
  - feature_card.dart
- themes/
  - colors.dart
  - app_theme.dart
Make sure the UI code is beautiful, readable, and scalable. Prioritize clarity and reuse.
  