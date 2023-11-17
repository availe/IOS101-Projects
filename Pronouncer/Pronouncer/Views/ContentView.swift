import SwiftUI

struct ContentView: View {
    @StateObject private var wordTabViewModel = WordTabViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(spacing: 0){
                    SelectWordBarTitle()
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            SelectWordBar(wordTabViewModel: wordTabViewModel)
                        }
                    }
                }
                WordDefinition(currSelectedWord: $wordTabViewModel.currSelectedWord).padding(.top)
                    HearPronunciationViewModel(currSelectedWord: $wordTabViewModel.currSelectedWord).padding(.top)
                    YouPronounceViewModel(currSelectedWord: $wordTabViewModel.currSelectedWord).padding(.top)
                Spacer()
            }.navigationTitle("Dashboard")
        }
    }
}
#Preview {
    ContentView()
}
