//
//  NoteView.swift
//  WordsPaper
//
//  Created by HarrisShao on 2025/6/14.
//

import SwiftUI

struct NoteView: View {
    
    @EnvironmentObject var viewModel:ViewModel
    
    var body: some View {
    
        ZStack {
            Color(.systemGray6).edgesIgnoringSafeArea(.all)
            
            NoteCardList
    
        }
        
    }
    
    private var NoteCardList: some View {
        ScrollView {
            
            if viewModel.sentenceModel.isEmpty {
                DefaultImage
                
            } else {
                ForEach(viewModel.sentenceModel, content: { item in
                    NoteCard(sentence: item.sentence, create_time: item.create_time)
                        .contextMenu{
                            Button("删除") {
                                viewModel.deleteNote(id: item.id)
                            }
                        }
                })
            }
            
        }
    }
    
    private var DefaultImage: some View {
        Image(systemName:"note.text.badge.plus")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(maxWidth: .infinity)
            .foregroundStyle(.blue)
            .padding()
    }
    
}

struct NoteCard:View {
    
    var sentence: String
    var create_time:String
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading, content: {
                Text(sentence)
                    .lineLimit(2)
                Spacer()
                
                Text(create_time)
                    .foregroundStyle(Color.gray)
            })
            Spacer()

        }
        .frame(maxWidth: .infinity, minHeight: 60, maxHeight: 80)
        .padding()
        .background(.white)
        .cornerRadius(20)
        .padding(.horizontal)
    }
}
//
//#Preview {
//    NoteView()
//}
