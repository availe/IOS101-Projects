import SwiftUI

struct WordDefinition: View {
    @State private var isExpanded = false
    @Binding var currSelectedWord: WordEntry?
    @State var definition: String = "Loading definition..."
    
    var body: some View {
        let titleKey = currSelectedWord?.word ??  "Waiting for word..."
        
        DisclosureGroup(
            isExpanded: $isExpanded,
            content: { Text(definition).font(.title2).foregroundStyle(.white) },
            label: {
                HStack {
                    Spacer()
                    Image(systemName: isExpanded ? "lightbulb.fill" : "lightbulb").font(.title2).foregroundColor(.white)
                    Text(titleKey).font(.title).fontWeight(.semibold).foregroundStyle(.white)
                    Spacer()
                }
            }
        ).padding(.all, 5).frame(maxWidth: 250, alignment: .center).background(Color.blue.opacity(0.95)).cornerRadius(3.0).disabled(currSelectedWord == nil)
            .onChange(of: currSelectedWord) {
            if let wordEntry = currSelectedWord {
                DefinitionManager.extractDefinitionString(for: wordEntry) { definition in
                    self.definition = definition ?? "No definition available"
                    self.currSelectedWord?.definition = definition ?? "No definition available"
                }
            }
        }
    }
}

#Preview {
    WordDefinition(currSelectedWord: .constant(WordEntry(id: 0, word: "Sample")))
}
