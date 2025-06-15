//
//  ContentView.swift
//  WordsPaper
//
//  Created by HarrisShao on 2025/6/14.
//

import SwiftUI

struct ContentView: View {

    @State var sentences: [(Color, String)] = [
        (.red, "在那些心情低落经历挫折的日子，幸好有这么一些图书能赶走阴霾，治愈伤痛。"),
        (.green, "这理应是一个审美多元的年代，每个人都有爱美的权利。"),
        (.blue, "这个世界有无数种可能，专注追寻一种可能，它终将会发生。"),
        (.pink, "最好的教育方式，是真诚诉说真实的故事。"),
        (.purple, "文艺感是一直潮流的东西，很多人只是想追随潮流而已。"),
    ]
    @State private var selectedTabIndex = 0
    @State var sentence:String = ""
    
    @EnvironmentObject var viewModel:ViewModel

    var body: some View {
//        Text(sentence)
        
        ZStack {
            Color(.systemGray6).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 48, content: {
                slideCard
                copyBtnView
            })
   
        }
        .onAppear(){
            sentence = sentences[selectedTabIndex].1
        }

    }
    
    private var slideCard: some View {
        TabView(selection: $selectedTabIndex, content: {
            ForEach(0 ..< sentences.count, id:\.self) { index in
                
                TextCard(bgColor:sentences[index].0, text: sentences[index].1)
            }
        })
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .frame(height: UIScreen.main.bounds.height / 3)
        .onChange(of: selectedTabIndex) { oldValue, newValue in
            sentence = sentences[selectedTabIndex].1
        }
    }
    
    
    private var copyBtnView: some View {
        Button {
            viewModel.addNote(sentence:sentence)
        } label: {
            Label("收藏", systemImage: "square.filled.on.square")
                .bold()
                .foregroundStyle(.white)
                .padding(.vertical)
                .padding(.horizontal, 48)
                .background(.green)
                .cornerRadius(16)
            
        }

    }
    
    struct TextCard: View {
        
        var bgColor: Color
        var text: String
        
        var body: some View {
            
            ZStack {
                Rectangle()
                    .fill(bgColor)
                    .cornerRadius(10)
                    .opacity(0.5)
                
                Text(text)
                    .font(.system(size: 20))
                    .foregroundStyle(Color.white)
                    .padding(32)
                    
            }
            .frame(height: UIScreen.main.bounds.height / 3)
            .padding()
            
        }
    }
    
    
}


//
//#Preview {
//    ContentView()
//}
