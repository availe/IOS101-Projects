import Foundation

class DefinitionManager {
    static func fetchDefinitionJSON(for wordEntry: WordEntry, completion: @escaping (String?) -> Void) {
        APIManager.fetchJSON(for: wordEntry) { dictionaryEntry in
            // navigate to struct Meanings
            let firstMeaning = dictionaryEntry.first?.meanings?.first
            // navigate to struct Definitions and get definition string from it
            let definition = firstMeaning?.definitions.first?.definition
            DispatchQueue.main.async {
                completion(definition)
            }
        }
    }
    
    static func extractDefinitionString(for wordEntry: WordEntry, completion: @escaping (String?) -> Void) {
        DefinitionManager.fetchDefinitionJSON(for: wordEntry) { fetchedDefinition in
            let updatedEntry = wordEntry
            updatedEntry.definition = fetchedDefinition ?? "No definition found."
            DispatchQueue.main.async {
                completion(updatedEntry.definition)
            }
        }
    }
}
