//
//  RepoDetailView.swift
//  GitHubClient
//
//  Created by コウスケ on 2026/09/16.
//

import SwiftUI

struct RepoDetailView: View {
    let repo: Repo
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Image(.githubMark)
                        .resizable()
                        .frame(width: 16.0, height: 16.0)
                    Text(repo.owner.name)
                        .font(.caption)
                }
                Text(repo.name)
                    .font(.body)
                    .fontWeight(.bold)
                if let description = repo.description {
                    Text(description)
                        .padding(.top, 4)
                }
                HStack {
                    Image(systemName: "star")
                    Text(String(repo.stargazersCount) + " stars")
                }
                .padding(.top, 8)
                Spacer()    // VStackの上詰めにする余白
            }
            Spacer()    // HStackを左詰めにする余白
        }
        .padding(8)
        .navigationTitle("Repository Detail")
    }
}

#Preview {
    RepoDetailView(repo: .mock1)
}
