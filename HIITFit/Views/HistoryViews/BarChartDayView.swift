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
import Charts

struct BarChartDayView: View {
	let day: ExerciseDay

	var body: some View {
		// Declare that you are creating a Swift Chart.
		Chart {
			ForEach(Exercise.names, id: \.self) { name in
				// Inside the chart, determine what sort of mark to use. This chart will be a bar chart, but it could also be an area, line or point chart.
				BarMark(
					// On the x-axis, you create a plottable value with a label and a string value.
					x: .value(name, name),
					// Similarly, on the y-axis, you create a plottable value with a label and an integer value.
					y: .value("Total count", day.countExercise(exercise: name))
				)
				.foregroundStyle(Color("history-bar"))
			}
			// add a rule mark to show that you should perform at least one of the exercises per day.
			RuleMark(y: .value("Exercise", 1))
				.foregroundStyle(.red)
		}
	}
}

struct BarCharDayView_Previews: PreviewProvider {
	static var historyStore = HistoryStore(preview: true)
	static var previews: some View {
		BarChartDayView(day: historyStore.exerciseDays[0])
			.environmentObject(historyStore)
	}
}
