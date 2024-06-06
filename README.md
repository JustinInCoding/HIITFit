# HIITFit
[![en](https://img.shields.io/badge/lang-en-red.svg)](https://github.com/JustinInCoding/HIITFit/blob/main/README.md)
[![zh-cn](https://img.shields.io/badge/lang-zh--cn-blue.svg)](https://github.com/JustinInCoding/HIITFit/blob/main/README.zh-cn.md)

> This project is for me to learn from kodeco's iOS book SwiftUI Apprentice. Here I try to grasp the knowledge of SwiftUI by recording the steps of building the app.

## Branches
- The Challenge branch is the approach of the challenge in the books for not pollute the main one.

## Technologies Used

- Use Form and Section to display History View
- Use dev data when developing rather than on release by conditional compilation and with Preview Content
- The onTapGesture modifier is used to add action on non-button view
- use .presentationDetents([.medium, .large]) of the presented view to make the sheet shorter on iphone
- use @Binding Bool value or @Environment(\.dismiss) to dismiss a modal sheet
- use TimelineView instead of Text to implement the count down
- use @environmentObject to avoid just passing through object to the next view/page
- use @AppStorage to save rating
- add initializer to the RatingView for preventing miss match the length of ratings and exercises's count
- make app supports multiple windows then u can have the app with others or have two exercises together on iPad
- use onChange again to make two windows' rating value sync.
- use @SceneStorage to remeber the selected tab last time you left the app
- use try...catch with error to handle the error may be caused by load from or save to a file
- use Alert to inform user loading file error
- use map to transform exerciseDay to plistData
- use custom button style with shadow to make a neumorphic button
- use @ViewBuilder to fix the compiler error which expects some View to be one type of view


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
- Note: Putting the modifier on its own line is a SwiftUI convention. A view often has several modifiers, each on its own line. This makes it easy to move a modifier up or down, because sometimes the order makes a difference.
- The [SF Symbols app](https://apple.co/3hWxn3G) is the best way to browse and explore the collection
- A type property belongs to the type, and you declare it with the static keyword.
- if you get the result of no resource of main bundle, try to check the build phase's Copy bundle Reources
- Swift Tip: It’s good programming practice to replace unused parameter names with _. The alternative is to create a throwaway name, which takes a non-zero amount of time and focus and will confuse you and other programmers reading your code.
- Note that if you use the `#Preview` macro, `.sizeThatFits` will not work, even if you use the static preview containter.
```
struct xxx_Previews: PreviewProvider {
	static var previews: some View {
		xxx()
			.previewLayout(.sizeThatFits)
	}
}
```
- using the Text view’s (_:style:) initializer for displaying dates and times
- use GeometryReader to make the subviews fit the device's size
- Swift Tip: A Date object is just some number of seconds relative to January 1, 2001 00:00:00 UTC. To display it as a calendar date in a particular time zone, you must use a DateFormatter. This class has a few built-in styles named short, medium, long and full, described in links from the developer documentation page for DateFormatter.Style. You can also specify your own format as a String.
- Swift Tip: You can add methods to extend any type, including those built into the software development kit, like Image and Date. Then, you can use them the same way you use the built-in methods.
- Formatting Quick Help Comments [reference](https://apple.co/33hohbk)
- check whether the current Build Configuration is Debug, click the Scheme menu button (next to the run destination menu). Select Edit Scheme…, then select the Info tab.
- Preview Content. Anything you put into this group will not be included in your release version
- often used together when modifiying an image
```
    .resizable()
    .aspectRatio(contentMode: .fill)
    .frame(width: xxx, height: xxx)

```
- A @State property is a source of truth. One view owns it and passes either its value or a reference, known as a binding, to its subviews.
- A @Binding property is a reference to a @State property owned by another view. It gets its initial value when the other view passes it a binding, using the $ prefix. Having this reference to the source of truth enables the subview to change the property’s value, and this changes the state of any view that depends on this property.
- @EnvironmentObject declares dependency on some shared data — data that’s visible to all views in a sub-tree of the app. It’s a convenient way to pass data indirectly instead of passing data from parent view to child to grandchild, especially if the in-between child view doesn’t need it.
- Swift has a TimelineView container that redraws its content at scheduled times. use `animation(minimumInterval:paused:)` to implement the TimeView
- To be an @EnvironmentObject, it must conform to ObservableObject. An ObservableObject is a publisher. Also to conform to ObservableObject, it must be a class, not a structure.
- different ways of persisting data: UserDefaults, PList, JSON file, Core Data
- @AppStorage is a property wrapper, similar to @State and @Binding, that allows interaction between UserDefaults and your SwiftUI views
- Inside your app sandbox are two sets of directories. First, you’ll examine the app bundle and then the user data.
- If you have some default data included with your bundle that your user should be able to change, you would need to copy the bundle data to the user data directories when your user runs the app after first installation.
- some significant directories defined by Apple [here](https://developer.apple.com/documentation/foundation/url)
- URL.documentsDirectory: Documents/. The main documents directory for the app.
- URL.libraryDirectory: Library/. The directory for files that you don’t want to expose to the user.
- URL.cachesDirectory: Library/Caches/. Temporary cache files. You might use this if you expand a zipped file and temporarily access the contents in your app.
- iPhone and iPad backups will save Documents and Library, excluding Library/Caches.
- UserDefaults file locates in Library/Preferences
- you can’t index directly into a String, text.index(_:offsetBy:) returns a String.Index, You can then use this special index in square brackets
- Note: You can do so much string manipulation that you’ll need [Use Your Loaf’s Swift String cheat sheet](https://useyourloaf.com/blog/swift-string-cheat-sheet/)
- Note: You can find more information about RangeExpressions in the [official Apple documentation](https://developer.apple.com/documentation/swift/rangeexpression).
- Locate Application Scene Manifest in the Custom iOS Target Properties, and open the disclosure indicator. Enable Multiple Windows has a value of YES
- by using @SceneStorage, you can persist the current state of each scene of your app, @SceneStorage properties persist per scene.
- To reset SceneStorage in Simulator, you will have to clear the cache. In Simulator, choose Device ▸ Erase All Content and Settings… and then re-run your app.
- Swift Tip: Optional is actually an enumeration with two cases: some(Wrapped) and none, where some has a generic value of type Wrapped and none has no value.
- Note: When the test is a simple one, you can shorten the test and assignment from if let varName = varName {...} to if let varName {...}.
- @State, being so transient, is incompatible with reference objects and, as HistoryStore is a class, @StateObject is the right choice here. @StateObject is a read-only property wrapper. You get one chance to initialize it, and you can’t change the property once you set it.
- use the type cast operator as? when fetch the data from plist file and map it to some type
- save and load historys by plist
- abstract small piece of view and style
- [a range of style protocols for you to customize](https://developer.apple.com/documentation/swiftui/view-styles)
- If you want to customize how the button action triggers with gestures, you can use PrimitiveButtonStyle instead of ButtonStyle
- Internally, @ViewBuilder takes in up to ten views and combines them into one TupleView. A tuple is a loosely formed type made up of several items. (for old api like 13.0)
- @ViewBuilder has ten buildBlock(...) methods and, depending on how many contained views there are, calls the appropriate method. Have you ever tried to add more than ten views in a VStack? Because there are only ten methods for building up views in ViewBuilder, you’ll get a compile error: Extra argument in call. (for old api like 13.0)
- use @ViewBuilder to create custom Container View with styles background
- use `fixedSize(horizontal: , vertical: )` fits the text in different size devices
- use `ViewThatFits` to fit the screen, always try the first but when the space is tight, it'll turn to the alternative one
- use LinearGradient to add gradient background on app
- if you come up with the error messages: ForEach<Array, String, Text>: the ID Burpee occurs multiple times within the collection, this will give undefined results!, means ForEach requires each item to be uniquely identifiable
- use `set` to make a collection be unique

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

- Declare SwiftUI views in the order you want them to appear.
- Create separate views for your user interface elements. This makes your code easier to read and maintain.
- Put each view modifier on its own line. This makes it easy to move or delete a modifier.
- Xcode and SwiftUI auto-suggestions and default values are often what you want.
- Let Xcode help you avoid errors: Use the Command-menu to embed or extract views.
- The SF Symbols app and Xcode’s Symbols Library provide icon images you can configure like text.
- Preview variants make it easy to check your interface for different user settings.
- An enumeration is a named type, useful for grouping related values so the compiler can help you avoid mistakes like misspelling a string.
- Swift is a strongly typed programming language.
- GeometryReader enables you to set a view’s dimensions relative to the screen dimensions.

- The Date type has many built-in properties and methods. You need to configure a DateFormatter to create meaningful text to show your users.
- Use the Form container view to quickly lay out table data.
- ForEach lets you loop over the items in a collection.
To use a collection in a ForEach loop, it needs to have a way to uniquely identify each of its elements. The easiest way is to make it conform to Identifiable and include id: UUID as a property.
- Use compiler directives to create development data only while you’re developing and not in the release version of your app.
- Preview Content is a convenient place to store code and data you use only while developing. Its contents won’t be included in the release version of your app.
- ZStack is useful for keeping views in one layer centered while pushing views in another layer to the edges.
- You can specify vertical alignment values for HStack, horizontal alignment values for VStack and combination alignment values for ZStack.
- Xcode helps you to refactor the name of a parameter quickly and safely.
- Image often needs the same three modifiers. You can create a custom modifier so you Don’t Repeat Yourself.
- A Button has a label and an action. You can define a Button a few different ways.

- Declarative app development means you declare both how you want the views in your UI to look and also what data they depend on. The SwiftUI framework takes care of creating views when they should appear and updating them whenever there’s a change to data they depend on.
- Data access = dependency: Reading a piece of data in your view creates a dependency for that data in that view.
- Single source of truth: Every piece of data has a source of truth, internal or external. Regardless of where the source of truth lies, you should always have a single source of truth.
- Property wrappers augment the behavior of properties: @State, @Binding and @EnvironmentObject declare a view’s dependency on the data represented by the property.
- @Binding declares dependency on a @State property owned by another view. @EnvironmentObject declares dependency on some shared data, like a reference type that conforms to ObservableObject.
- Use Boolean @State properties to show and hide modal sheets or subviews. Use @Environment(\.dismiss) as another way to dismiss a modal sheet.

- Implement a countdown timer by creating a TimelineView with an animation(minimumInterval:paused:) schedule to update CountdownView every 1 second.
- @Binding declares a dependency on a @State property owned by another view. @EnvironmentObject declares a dependency on some shared data, such as a reference type that conforms to ObservableObject.
- Use an ObservableObject as an @EnvironmentObject to let subviews access data without having to pass parameters.

- Optionals are properties that can contain nil. Optionals make your code more secure, as the compiler won’t allow you to assign nil to non-optional properties. You can use guard let to unwrap an optional or exit the current method if the optional contains nil.
- Don’t force-unwrap optionals by marking them with an !. It is tempting to use an ! when assigning optionals to a new property because you think the property will never contain nil. Instead, try and keep your code safe by assigning a fall-back value with the nil coalescing operator ??.
- Use breakpoints to halt execution and step through code to confirm that it’s working correctly and that variables contain the values you expect.
- Use throw to throw errors in methods marked by throws.
- If you need to handle errors, call methods marked by throws with do { try ... } catch { ... }. catch will only be performed if the try fails. If you don’t need to handle errors, you can call the method with let result = try? method(). result will contain nil if there is an error.
- Use @StateObject to hold your data store. Your app will only initialize a state object once.
- Closures are chunks of code that you can pass around just as you would any other object. You can assign them to variables or provide them as parameters to methods. Array has a number of methods requiring closures to transform its elements into a new array.
- PropertyListSerialization is just one way of saving data to disk. You could also use JSON, or Core Data, which manages objects and their persistence.

- It’s not always possible to spend money on hiring a designer, but you should definitely spend time making your app as attractive and friendly as possible. Try various designs out and offer them to your testers for their opinions.
- Neumorphism is a simple style that works well. Keep up with designer trends at https://dribbble.com.
- Style protocols allow you to customize various view types to fit in with your desired design.
- Using @ViewBuilder, you can return varying types of views from methods and properties. It’s easy to create custom container views that have added styling or functionality.
- You can layer background colors in the safe area, but don’t place any of your user interface there.
- Gradients are an easy way to create a stand-out design. You can find interesting gradients at https://uigradients.com.

## Acknowledgements
Thanks for the kodeco's team providing such a great book
- Original Repository of Kodeco [_here_](https://github.com/kodecocodes/suia-materials/tree/editions/2.0).

