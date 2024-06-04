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
// Importing AVKit lets you use high-level types like AVPlayer to play videos with the usual playback controls.
import AVKit

struct VideoPlayerView: View {
	let videoName: String
	var body: some View {
		// Command-click VideoPlayer and select Make Conditional
		// you can access as Bundle.main. Its method url(forResource:withExtension:) gets you the URL of a file in the main app bundle if it exists. Otherwise, it returns nil which means no value. The return type of this method is an Optional type, URL?
		// make sure the build phases's copy bundle resource has the resources
		if let url = Bundle.main.url(forResource: videoName, withExtension: "mp4") {
			VideoPlayer(player: AVPlayer(url: url))
		} else {
			Text("Couldn't find \(videoName).mp4")
				.foregroundColor(.red)
		}

	}
}

#Preview {
	VideoPlayerView(videoName: "squat")
}
