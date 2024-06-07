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

import Foundation

struct ExerciseDay: Identifiable {
	let id = UUID()
	let date: Date
	var exercises: [String] = []

	var uniqueExercises: [String] {
		Array(Set(exercises)).sorted(by: <)
	}

	func countExercise(exercise: String) -> Int {
		exercises.filter { $0 == exercise }.count
	}
}

class HistoryStore: ObservableObject {
	@Published var exerciseDays: [ExerciseDay] = []
	@Published var loadingError = false

	enum FileError: Error {
		case loadFailure
		case saveFailure
	}

	var dataURL: URL {
		URL.documentsDirectory
			.appendingPathComponent("history.plist")
	}

	init(preview: Bool = false) {
		do {
			try load()
		} catch {
			loadingError = true
		}
		#if DEBUG
		if preview {
			createDevData()
		} else {
			// copies a sample history.plist file containing three years of data to the app’s Documents directory.
			copyHistoryTestData()
			try? load()
		}
		#endif
	}

	func load() throws {
		// Read the data file into a byte buffer. The first time open the app there's
		// no file, so ignore it
		guard let data = try? Data(contentsOf: dataURL) else {
			return
		}
		do {
			// Convert the property list format into plistData
			let plistData = try PropertyListSerialization.propertyList(
				from: data,
				options: [],
				format: nil
			)
			// use the type cast operator as?
			let convertedPlistData = plistData as? [[Any]] ?? []
			// cast to the expected type
			exerciseDays = convertedPlistData.map {
				ExerciseDay(
					date: $0[1] as? Date ?? Date(),
					exercises: $0[2] as? [String] ?? []
				)
			}
		} catch {
			throw FileError.loadFailure
		}
	}

	func save() throws {
		let plistData = exerciseDays.map {
			[$0.id.uuidString, $0.date, $0.exercises]
		}
		do {
			// convert your history data to a serialized property list format. The result is a Data type, which is a buffer of bytes.
			let data = try PropertyListSerialization.data(
				fromPropertyList: plistData,
				format: .binary,
				options: .zero
			)
			// write to disk
			try data.write(to: dataURL, options: .atomic)
		} catch {
			// catch by throwing an error
			throw FileError.saveFailure
		}
	}

	func addDoneExercise(_ exerciseName: String) {
		let today = Date()
		if let firstDate = exerciseDays.first?.date, today.isSameDay(as: firstDate) {
			exerciseDays[0].exercises.append(exerciseName)
		} else {
			exerciseDays.insert(
				ExerciseDay(date: today, exercises: [exerciseName]),
				at: 0
			)
		}
		do {
			try save()
		} catch {
			fatalError(error.localizedDescription)
		}
	}

	func addExercise(date: Date, exerciseName: String) {
		let exerciseDay = ExerciseDay(date: date, exercises: [exerciseName])
		// find the first index in the exerciseDays array
		// where the date is less than or equal to the passed-in date.
		if let index = exerciseDays.firstIndex(
			where: { $0.date.yearMonthDay <= date.yearMonthDay }) {
			// If you find a date in the array that’s the same as the passed-in date,
			// you append the exercise name to the already existing array element.
			if date.isSameDay(as: exerciseDays[index].date) {
				exerciseDays[index].exercises.append(exerciseName)
			} else {
				// If the date doesn’t already exist in the array,
				// then insert it at the appropriate position.
				exerciseDays.insert(exerciseDay, at: index)
			}
		} else {
			// If the date is earlier than all the dates in the array,
			// or the array is empty,
			// then append the date to the array.
			exerciseDays.append(exerciseDay)
		}
		// Save the history data.
		try? save()
	}
}
