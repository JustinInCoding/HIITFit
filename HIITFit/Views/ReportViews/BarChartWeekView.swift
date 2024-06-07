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

struct BarChartWeekView: View {
	@EnvironmentObject var historyStore: HistoryStore
	@State private var weekData: [ExerciseDay] = []
	@State private var isBarChart = true

	var body: some View {
		VStack {
			Text("History for Last Week")
				.font(.title)
				.padding()
			if isBarChart {
				// When you don’t need a separate ForEach, you can initialize Chart with the chart data.
				Chart(weekData) { day in
					ForEach(Exercise.names, id: \.self) { name in
						BarMark(
							x: .value("Date", day.date, unit: .day),
							y: .value("Total Count", day.countExercise(exercise: name))
						)
						.foregroundStyle(by: .value("Exercise", name))
					}
				}
					.chartForegroundStyleScale([
						"Burpee": Color("chart-burpee"),
						"Squat": Color("chart-squat"),
						"Step Up": Color("chart-step-up"),
						"Sun Salute": Color("chart-sun-salute")
					])
					.padding()
			} else {
				Chart(weekData) { day in
					LineMark(
						x: .value("Date", day.date, unit: .day),
						y: .value("Total Count", day.exercises.count)
					)
					.symbol(.circle)
					.interpolationMethod(.catmullRom)
				}
			}
			Toggle("Bar Chart", isOn: $isBarChart)
				.padding()
		}
			.onAppear {
				// Find out the first date in history. If there isn’t one, use the current date.
				let firstDate = historyStore.exerciseDays.first?.date ?? Date()
				// Set up an array using a method already created for you in DateExtension.swift.
				let dates = firstDate.previousSevensDays
				// Iterate through the array of dates and for each date, locate the first entry for that date. If there isn’t one, create a new blank ExerciseDay.
				weekData = dates.map { date in
					historyStore.exerciseDays.first(
						where: { $0.date.isSameDay(as: date)}
					) ?? ExerciseDay(date: date)
				}
			}
	}
}

struct BarChartWeekView_Previews: PreviewProvider {
	static var previews: some View {
		BarChartWeekView()
			.environmentObject(HistoryStore(preview: true))
	}
}
