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

struct HeaderView: View {
	@Binding var selectedTab: Int
	let titleText: String

	func dot(selected: Bool) -> some View {
		ZStack {
			Circle()
				.foregroundColor(Color.white)
				.frame(width: 32, height: 32)
				.opacity(selected ? 0.5 : 0)
			Circle()
				.foregroundColor(Color.white)
				.frame(width: 16, height: 16)
		}
	}

	var body: some View {
		ZStack {
			VStack {
				Text(titleText)
					.fontWeight(.black)
					.font(.largeTitle)
					.foregroundColor(.white)
				HStack() {
					ForEach(Exercise.exercises.indices, id: \.self) { index in
						dot(selected: index == selectedTab)
							.onTapGesture {
								selectedTab = index
							}
					}
				}
				.font(.title2)
			}
		}
	}


}

struct HeaderView_Previews: PreviewProvider {
	static var previews: some View {
		HeaderView(selectedTab: .constant(0), titleText: "Squat")
			.background(Color.black)
			.previewLayout(.sizeThatFits)
	}
}
