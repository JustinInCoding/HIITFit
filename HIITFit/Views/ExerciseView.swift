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

struct ExerciseView: View {
	@EnvironmentObject var historyStore: HistoryStore
	
	@State private var showSuccess = false
	@State private var showHistory = false
	@AppStorage("rating") private var rating = 0
	@Binding var selectedTab: Int
	
	let index: Int

	@State private var timerDone = false
	@State private var showTimer = false

	var exercise: Exercise {
		Exercise.exercises[index]
	}

	var lastExercise: Bool {
		index + 1 == Exercise.exercises.count
	}

	var startButton: some View {
		RaisedButton(buttonText: "Start Exercise") {
			showTimer.toggle()
		}
	}

	var historyButton: some View {
		Button {
			showHistory.toggle()
		} label: {
			Text("History")
				.fontWeight(.bold)
				.padding([.leading, .trailing], 5)
		}
			.padding([.bottom])
			.buttonStyle(EmbossedButtonStyle())
	}

	var body: some View {
		GeometryReader { geometry in
			// spacing 0 is for small phone like iPhone SE which will push the History button down a little bit or off the screen
			VStack(spacing: 0) {
				HeaderView(selectedTab: $selectedTab, titleText: exercise.exerciseName)
					.padding(.bottom)
				Spacer()
				ContainerView {
					VStack{
						VideoPlayerView(videoName: exercise.videoName)
							.frame(height: geometry.size.height * 0.35)
							.padding(20)

						HStack(spacing: 150) {
							startButton
								.padding([.leading, .trailing], geometry.size.width * 0.1)
								.sheet(isPresented: $showTimer) {
									TimerView(
										timerDone: $timerDone,
										exerciseName: exercise.exerciseName
									)
										.onDisappear {
											if timerDone {
												historyStore.addDoneExercise(exercise.exerciseName)
												timerDone = false
												if lastExercise {
													showSuccess.toggle()
												} else {
													withAnimation {
														selectedTab += 1
													}
												}
											}
										}
								}
								.sheet(isPresented: $showSuccess) {
									SuccessView(selectedTab: $selectedTab)
										.presentationDetents([.medium, .large])
								}
						}
							.font(.title3)
							.padding()

						Spacer()

						RatingView(exerciseIndex: index)
							.padding()

						historyButton
							.sheet(isPresented: $showHistory, content: {
								HistoryView(showHistory: $showHistory)
							})
							.padding(.bottom)
					}
				}
				.frame(height: geometry.size.height * 0.8)
			}
		}
	}
}

#Preview {
	ExerciseView(selectedTab: .constant(0), index: 0)
		.environmentObject(HistoryStore())
}




