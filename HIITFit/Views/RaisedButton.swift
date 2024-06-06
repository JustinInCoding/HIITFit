/// Copyright (c) 2024
/// HIITFit
/// Justin    
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

struct RaisedButton: View {
	let buttonText: String
	let action: () -> Void

	var body: some View {
		Button {
			action()
		} label: {
			// "Get Started"
			Text(buttonText)
				.raisedButtonTextStyle()
		}
		.buttonStyle(.raised)
	}
}

// customize buttons by setting up a structure that conforms to ButtonStyle
struct RaisedButtonStyle: ButtonStyle {
	// ButtonStyle has one required method: makeBody(configuration:)
	func makeBody(configuration: Configuration) -> some View {
		configuration.label
			.frame(maxWidth: .infinity)
			.padding([.top, .bottom], 12)
			.background(
				Capsule()
					.foregroundColor(Color("background"))
					.shadow(color: Color("drop-shadow"), radius: 4, x: 6, y: 6)
					.shadow(color: Color("drop-highlight"), radius: 4, x: -6, y: -6)
			)
	}
}

// makes using the button style more Swift-y.
// Instead of adding a button style: buttonStyle(RaisedButtonStyle()),
// you can instead use: buttonStyle(.raised).
extension ButtonStyle where Self == RaisedButtonStyle {
	static var raised: RaisedButtonStyle {
		.init()
	}
}

// just play around for a while
//struct triggeredButtonStyle: PrimitiveButtonStyle {
//	func makeBody(configuration: Configuration) -> some View {
//		configuration.label
//			.onTapGesture {
//				configuration.trigger()
//			}
//			.font(
//				configuration.role == .cancel ? .title2.bold() : .title2
//			)
//			.foregroundColor(
//				configuration.role == .destructive ? Color.red : nil
//			)
//	}
//}

extension Text {
	func raisedButtonTextStyle() -> some View {
		self
			.font(.body)
			.fontWeight(.bold)
	}
}

struct RaisedButton_Previews: PreviewProvider {
	static var previews: some View {
		ZStack {
			RaisedButton(buttonText: "Get Started") {
				print("Hello world")
			}
				.padding(20)
		}
		.background(Color("background"))
		.previewLayout(.sizeThatFits)
	}
}
