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

struct SuccessView: View {
	@Environment(\.dismiss) var dismiss
	var body: some View {
		ZStack {
			VStack {
				Spacer()
				Button {
					dismiss()
				} label: {
					Text("Continue")
				}
				.padding(.bottom)
			}
			VStack {
				Image(systemName: "hand.raised.fill")
					.resizedToFill(width: 75.0, height: 75.0)
					.foregroundColor(.purple)
				Text("High Five")
					.fontWeight(.semibold)
					.font(.largeTitle)
				Text(
				"""
				Good job completing all four exercises!
				Remember tomorrow's another day.
				So eat well and get some rest.
				"""
				)
					.multilineTextAlignment(.center)
					.foregroundColor(.gray)
			}
		}
		.presentationDetents([.medium, .large])
	}
}

#Preview {
	SuccessView()
}
