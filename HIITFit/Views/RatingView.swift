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

struct RatingView: View {
	@AppStorage("ratings") private var ratings: String = "4000"
	@State private var rating = 0
	let exerciseIndex: Int
	let maximunRating = 5

	let onColor = Color.red
	let offColor = Color.gray

	func updateRating(index: Int) {
		rating = index
		let index = ratings.index(
			ratings.startIndex,
			offsetBy: exerciseIndex
		)
		// create a RangeExpression with index...index and replace the range with the new rating
		ratings.replaceSubrange(index...index, with: String(rating))
	}

	var body: some View {
		HStack {
			ForEach(1 ..< maximunRating + 1, id: \.self) { index in
				Image(systemName: "waveform.path.ecg")
					.foregroundColor(
						index > rating ? offColor : onColor
					)
					.onTapGesture {
						updateRating(index: index)
					}
					// app runs onAppear(perform:) every time the view appears
					.onAppear() {
						// ratings is labeled as @AppStorage so its value is stored in the UserDefaults property list file. You create a String.Index to index into the string using exerciseIndex.
						let index = ratings.index(
							ratings.startIndex,
							offsetBy: exerciseIndex
						)
						// extract the correct character from the string using the String.Index.
						let character = ratings[index]
						// use nil coalescing operator to Convert the character to an integer. If the character is not an integer, the result of wholeNumberValue will be an optional value of nil.
						rating = character.wholeNumberValue ?? 0
					}
			}
		}
		.font(.largeTitle)
	}
}

struct RatingView_Previews: PreviewProvider {
	@AppStorage("ratings") static var ratings: String?
	static var previews: some View {
		ratings = nil
		return RatingView(exerciseIndex: 0)
			.previewLayout(.sizeThatFits)
	}
}
