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

struct AddHistoryView: View {
	@Binding var addNode: Bool
	@State private var exerciseDate = Date()

	struct ButtonsView: View {
		@EnvironmentObject var historyStore: HistoryStore
		@Binding var date: Date

		var body: some View {
			HStack {
				ForEach(Exercise.exercises.indices, id: \.self) { index in
					let exerciseName = Exercise.exercises[index].exerciseName
					Button(exerciseName) {
						// save the exercise
						historyStore.addExercise(date: date, exerciseName: exerciseName)
					}
				}
			}
			.buttonStyle(EmbossedButtonStyle(buttonScale: 1.5))
		}
	}

	var body: some View {
		VStack {
			ZStack {
				Text("Add Exercise")
					.font(.title)
				Button("Done") {
					addNode = false
				}
				.frame(maxWidth: .infinity, alignment: .trailing)
			}
			ButtonsView(date: $exerciseDate)
			DatePicker(
				// The label of the control. This may not display, depending on the style of the date picker.
				"Choose Date",
				// The binding of the date being selected.
				selection: $exerciseDate,
				// An optional closed range. In this case, you don’t want to let the user select a future date, so you constrain the date range up to today.
				in: ...Date(),
				// Whether you want the date and/or the time to show.
				displayedComponents: .date)
			// The style of the picker. This can be a wheel, a compact drop-down or, in this case, a full calendar month view.
			.datePickerStyle(.graphical)
		}
		.padding()
	}
}

struct AddHistoryView_Previews: PreviewProvider {
	static var previews: some View {
		AddHistoryView(addNode: .constant(true))
			.environmentObject(HistoryStore(preview: true))
	}
}
