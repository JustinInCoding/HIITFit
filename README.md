# HIITFit
[![en](https://img.shields.io/badge/lang-en-red.svg)](https://github.com/JustinInCoding/HIITFit/blob/main/README.md)
[![zh-cn](https://img.shields.io/badge/lang-zh--cn-blue.svg)](https://github.com/JustinInCoding/HIITFit/blob/main/README.zh-cn.md)

> This project is for me to learn from kodeco's iOS book SwiftUI Apprentice. Here I try to grasp the knowledge of SwiftUI by recording the steps of building the app.


## Technologies Used
- 

## Features
- A Welcome screen with text, images and a button.
- A title and page numbers are at the top of the Welcome screen and a History button is at the bottom. These are also on the screen with the exercise video. The page numbers indicate there are four numbered pages after this page. The waving hand symbol is highlighted.
- The screen with the exercise video also has a timer, a Start/Done button and rating symbols. One of the page numbers is highlighted.
- The History screen shows the user’s exercise history as a list and as a bar chart. It has a title but no page numbers and no History button.
- The High Five! screen has an image, some large text and some small gray text. Like the History screen, it has no page numbers and no History button.

- The History and High Five! screens are modal sheets that slide up over the Welcome or Exercise screen. Each has a button the user taps to dismiss it, either a circled “X” or a Continue button.
- On the Welcome and Exercise screens, the matching page number is white text or outline on a black background. Tapping the History button displays the History screen.
- The Welcome page Get Started button displays the next page.
- On an Exercise page, the user can tap the play button to play the video of the exercise.
- On an Exercise page, tapping the Start Exercise button starts a countdown timer, and the button label changes to Done. Ideally, the Done button is disabled until the timer reaches 0. Tapping Done adds this exercise to the user’s history for the current day.
- On an Exercise page, tapping one of the five rating symbols changes the color of that symbol and all those preceding it.
- Tapping Done on the last exercise shows the High Five! screen.
- Nice to have: Tapping a page number goes to that page. Tapping Done on an Exercise page goes to the next Exercise page. Dismissing the High Five! screen returns to the Welcome page.


## Screenshots/Design
- [HIG-Foundations-Typography-Specifications](https://developer.apple.com/design/human-interface-guidelines/typography#Specifications)
<!-- ![Example screenshot](./img/screenshot.png) -->

## Setup
Xcode - 15.4 (the version I created the project)

## Tips and Learned
- Xcode Tip: Delimiter auto-completion works for curly and square braces, parentheses and quotation marks: Select the text you want to enclose, then type the start delimiter character
- Control-Option-click the view to pop up its Attributes inspector
- Xcode Tip: The show-inspectors button (upper right toolbar) opens the right-hand panel. The Attributes inspector is the right-most tab in this panel. If you’re working on a small screen and just want to edit one attribute, Control-Option-click a view in the code editor to use the pop-up inspector. It uses less space.
- use `tabViewStyle(PageTabViewStyle())` to make the tabs behave like pages
- `.indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))` to make the tabs show up
- creating and grouping project files

## Key Points
- The Xcode window has Navigator, Editor and Inspectors panes, a Toolbar and a Debug Area, plus a huge number of Settings.
- specify navigation keyboard shortcuts in Settings.
- The template project defines an App that launches with ContentView, displaying a globe symbol and “Hello, world!”.
- Quick Help documentation in an inspector or with a keyboard shortcut. Or, open the Developer Documentation window.
- When creating a new SwiftUI view file, give it the same name as the View you’ll create in it.
- Xcode’s auto-completion, delimiter-matching, code-folding and spell-checking help you avoid errors.
- You can choose one of Xcode’s font and color themes, modify one or create your own.
- You can run your app on a simulated device or create previews of specific devices.

- Plan your app by listing what the user will see and what the app will do.
- Build your app with views and subviews, customized with modifiers.
- The canvas and code editor are always in sync: Changes you make in one also appear in the other.
- Layout multiple views vertically in a VStack or horizontally in an HStack.
- The Attributes inspector helps you to modify a view or a preview.
- ForEach lets you loop over a half-open range of numbers.
- TabView can behave like a tab view or like a page controller.
- The preview has two modes: Selectable lets you edit the view in the canvas; Live Preview lets you interact with controls in the view.
- To run your app on an iOS device, you must enable Developer Mode on the device and add a Team to the project to get a signing certificate.
- The first time you run your project on an iOS device, Apple requires you to complete a “Trust this developer” step.


## Acknowledgements
Thanks for the kodeco's team providing such a great book
- Original Repository of Kodeco [_here_](https://github.com/kodecocodes/suia-materials/tree/editions/2.0).

