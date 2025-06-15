//
//  MainTabView.swift
//  WordsPaper
//
//  Created by HarrisShao on 2025/6/14.
//

import SwiftUI

struct MainTabView: View {
    
    @StateObject var viewModel = ViewModel()
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color.white)
    }
    
    var body: some View {
    
        TabView {
            ContentView()
                .environmentObject(viewModel)
                .tabItem {
                    Label("推荐", systemImage: "square.filled.on.square")
                }
            
            NoteView()
                .environmentObject(viewModel)
                .tabItem {
                    Label("笔记", systemImage: "note.text")
                }
        }
        
        
    }
}

#Preview {
    MainTabView()
}
