import SwiftUI
import AVFoundation

struct YouPronounceViewModel: View {
    @Binding var currSelectedWord: WordEntry?
    private let synthesizer = AVSpeechSynthesizer()
    
    var body: some View {
        Button {
            if let wordEntry = currSelectedWord {
                let readThis = "Word: \(wordEntry.word). Definition: \(wordEntry.definition ?? "No definition found")"
                let utterance = AVSpeechUtterance(string: readThis)
                utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
                utterance.rate = 0.4
                synthesizer.speak(utterance)
            }
        } label: {
            Label("You Try It!", systemImage: "mic").foregroundColor(.white).font(.title2)
        }.padding(.all, 10).background(.blue.opacity(0.95)).cornerRadius(3.0)
        
    }
}

#Preview {
    YouPronounceViewModel(currSelectedWord: .constant(WordEntry(id: 0, word: "sample", definition: "definition")))
}
