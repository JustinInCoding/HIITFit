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
		Button("Start Exercise") {
			showTimer.toggle()
		}
	}
	var doneButton: some View {
		Button("Done") {
			historyStore.addDoneExercise(exercise.exerciseName)
			timerDone = false
			showTimer.toggle()
			if lastExercise {
				showSuccess.toggle()
			} else {
				selectedTab += 1
			}
		}

	}
	var body: some View {
		GeometryReader { geometry in
			// spacing 0 is for small phone like iPhone SE which will push the History button down a little bit or off the screen
			VStack(spacing: 0) {
				HeaderView(selectedTab: $selectedTab, titleText: exercise.exerciseName)
					.padding(.bottom)
				VideoPlayerView(videoName: exercise.videoName)
					.frame(height: geometry.size.height * 0.45)

				HStack(spacing: 150) {
					startButton
					doneButton
						.disabled(!timerDone)
						.sheet(isPresented: $showSuccess, content: {
							SuccessView(selectedTab: $selectedTab)
						})
				}
				.font(.title3)
				.padding()

				if showTimer {
					TimerView(
						timerDone: $timerDone,
						size: geometry.size.height * 0.07
					)
				}
				Spacer()
				RatingView(exerciseIndex: index)
					.padding()
				Button("History") {
					showHistory.toggle()
				}
				.sheet(isPresented: $showHistory, content: {
					HistoryView(showHistory: $showHistory)
				})
					.padding(.bottom)
			}
		}
	}
}

#Preview {
	ExerciseView(selectedTab: .constant(0), index: 0)
		.environmentObject(HistoryStore())
}




