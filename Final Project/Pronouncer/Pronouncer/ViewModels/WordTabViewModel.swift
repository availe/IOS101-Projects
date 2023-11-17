import SwiftUI

class WordTabViewModel: ObservableObject {
    @Published var savedWords: [WordEntry]?
    @Published var currSelectedWord: WordEntry? = nil
    
    func selectWord(for wordEntry: WordEntry) {
        currSelectedWord = wordEntry
    }
    
    init() {
        self.savedWords = [
            WordEntry(id: 0, word: "Computer"),
            WordEntry(id: 1, word: "Canine"),
            WordEntry(id: 2, word: "Apple"),
        ]
    }
}

struct SelectWordBarTitle: View {
    var body: some View {
        Text("Saved Words:").font(.system(size: 20.0, weight: .semibold)).padding(.vertical, 10).padding(.leading, 10).frame(maxWidth: .infinity, alignment: .leading).padding(.top)
    }
}

struct SelectWordBar: View {
    @ObservedObject var wordTabViewModel: WordTabViewModel
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach (wordTabViewModel.savedWords ?? []) { wordEntry in
                WordTabBtn(wordEntry: wordEntry, viewModel: wordTabViewModel)
            }
        }
    }
}

struct WordTabBtn: View {
    let wordEntry: WordEntry
    let viewModel: WordTabViewModel
    
    var body: some View {
        Button {
            viewModel.selectWord(for: wordEntry)
        } label: {
            HStack {
                Text(wordEntry.word).fontWeight(.semibold).foregroundColor(.white).padding(.horizontal, 40).padding(.vertical, 20).frame(maxWidth: .infinity)
            }
        }.background(wordEntry.color.opacity(0.95)).cornerRadius(0).shadow(radius:3, x:0, y:3)
    }
}

#Preview {
    VStack {
        SelectWordBarTitle()
        ScrollView.init(.horizontal, showsIndicators: false) {
            SelectWordBar(wordTabViewModel: WordTabViewModel())
        }
        Spacer()
    }
}

