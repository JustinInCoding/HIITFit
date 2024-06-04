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
	@Binding var selectedTab: Int
	let index: Int
	let interval: TimeInterval = 30
	var exercise: Exercise {
		Exercise.exercises[index]
	}
	var lastExercise: Bool {
		index + 1 == Exercise.exercises.count
	}

	var startButton: some View {
		Button("Start Exercise") {}
	}
	var doneButton: some View {
		Button("Done") {
			selectedTab = lastExercise ? 9 : selectedTab + 1
		}
	}
	var body: some View {
		GeometryReader { geometry in
			VStack {
				HeaderView(titleText: exercise.exerciseName)
					.padding(.bottom)
				VideoPlayerView(videoName: exercise.videoName)
					.frame(height: geometry.size.height * 0.45)
				// The Date method addingTimeInterval(_ timeInterval:) adds interval seconds to this value
				Text(Date().addingTimeInterval(interval), style: .timer)
					.font(.system(size: geometry.size.height * 0.07))
				HStack(spacing: 150) {
					startButton
					doneButton
				}
				.font(.title3)
				.padding()
				RatingView()
					.padding()
				Spacer()
				Button("History") {}
					.padding(.bottom)
			}
		}
	}
}

#Preview {
	ExerciseView(selectedTab: .constant(1), index: 1)
}




