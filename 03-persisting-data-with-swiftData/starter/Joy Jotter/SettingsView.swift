/// Copyright (c) 2024 Kodeco Inc.
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
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

struct SettingsView: View {
  @EnvironmentObject var joyJotterVM: JoyJotterVM

  var body: some View {
    NavigationStack {
      Form {
        Section(header: Text("Show/Hide Options")) {
          Toggle("Show Favorite Tab", isOn: $joyJotterVM.isFavTabVisible)
            .onChange(of: joyJotterVM.isFavTabVisible) { _, newValue in
              UserDefaults.standard.set(newValue, forKey: "isFavTabVisible")
            }
          Toggle("Show Favorite button in Joke Card", isOn: $joyJotterVM.isFavVisibleInCard)
        }
      }
      .background(.white)
      .scrollContentBackground(.hidden)
    }
    .padding(.top, 20)
    .onAppear {
      // Set the initial isFavTabVisible based on the saved value
      joyJotterVM.isFavTabVisible = UserDefaults.standard.bool(forKey: "isFavTabVisible")
    }
  }
}

#Preview {
  SettingsView()
    .environmentObject(JoyJotterVM(jokes: JoyJotterVM.basicJokes))
}
