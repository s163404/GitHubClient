    //
//  ContentView.swift
//  GitHubClient
//
//  Created by コウスケ on 2026/08/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .trailing) {
            HStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            Text("Good evening, world!")
                .underline()
                .fontWeight(.bold)
        }
    }
}

#Preview {
    ContentView()
}
