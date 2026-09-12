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
                Image(.githubMark)
                    .resizable()
                    .frame(width: 44.0, height: 44.0)
                VStack(alignment: .leading){
                    Text("Owner Name")
                        .font(.caption)
                    Text("Repository Name")
                        .font(.body)
                        .fontWeight(.semibold)
                }

            }
        }
    }
}

#Preview {
    ContentView()
}
