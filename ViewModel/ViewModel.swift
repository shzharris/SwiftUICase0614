//
//  ViewModel.swift
//  WordsPaper
//
//  Created by HarrisShao on 2025/6/15.
//

import SwiftUI

class ViewModel : ObservableObject {
    @Published var sentenceModel: [ScentenceModel] = []
    
    init() {
        loadNoteData()
    }
    
    func addNote(sentence: String) {
        let newNote = ScentenceModel(sentence: sentence, create_time: getCreateTime())
        sentenceModel.append(newNote)
        print(sentenceModel)
        saveNote()
    }
    
    func getCreateTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let currentTime = Date()
        let formattedTime = dateFormatter.string(from: currentTime)
        return formattedTime
    }
    
    func saveNote() {
        do {
            let data = try JSONEncoder().encode(sentenceModel)
            
            if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                let fileURL = documentDirectory.appendingPathComponent("sentence.json")
                try data.write(to: fileURL)
            }
            
        } catch {
            print("保存失败信息:\(error)")
        }
    }
    
    func loadNoteData() {
        if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = documentDirectory.appendingPathComponent("sentence.json")
            do {
                let getData = try Data(contentsOf: fileURL)
                sentenceModel = try JSONDecoder().decode([ScentenceModel].self, from: getData)
            } catch {
                print("读取信息失败:\(error)")
            }
        }
    }
    
    func deleteNote(id: UUID) {
        if let index = sentenceModel.firstIndex(where: {$0.id == id}) {
            sentenceModel.remove(at: index)
            saveNote()
        }
            
    }
}
