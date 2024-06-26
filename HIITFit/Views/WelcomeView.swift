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

struct WelcomeView: View {
	@EnvironmentObject var historyStore: HistoryStore
	@State private var showHistory = false
	@State private var showReports = false
	@Binding var selectedTab: Int

	var getStartButton: some View {
		RaisedButton(buttonText: "Get Started") {
			selectedTab = 0
		}
		.padding()
	}

	var historyButton: some View {
		Button {
			showHistory.toggle()
		} label: {
			Text("History")
				.fontWeight(.bold)
				.padding([.leading, .trailing], 5)
		}
		.padding(.bottom)
		.buttonStyle(EmbossedButtonStyle())
	}

	var reportsButton: some View {
		Button {
			showReports.toggle()
		} label: {
			Text("Reports")
				.fontWeight(.bold)
				.padding([.leading, .trailing], 5)
		}
		.padding(.bottom)
		.buttonStyle(EmbossedButtonStyle())
	}

	var buttonHStack: some View {
		HStack(spacing: 40) {
			historyButton
			reportsButton
		}
		.padding(10)
	}


	var body: some View {
		GeometryReader { geometry in
			VStack {
				HeaderView(
					selectedTab: $selectedTab,
					titleText: "Welcome"
				)
				Spacer()
				ContainerView {
					ViewThatFits {
						VStack {
							WelcomeView.images
							WelcomeView.welcomeText
							getStartButton
							Spacer()
							buttonHStack
						}
						VStack {
							WelcomeView.welcomeText
							getStartButton
							Spacer()
							buttonHStack
						}
					}
				}
				.frame(height: geometry.size.height * 0.8)
			}
			.sheet(isPresented: $showHistory, content: {
				HistoryView(showHistory: $showHistory)
			})
			.sheet(isPresented: $showReports) {
				BarChartWeekView()
			}
		}
	}
}

#Preview {
	WelcomeView(selectedTab: .constant(9))
}
