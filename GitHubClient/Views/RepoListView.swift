    //
//  ContentView.swift
//  GitHubClient
//
//  Created by コウスケ on 2026/08/11.
//

import SwiftUI

struct RepoListView: View {
    @State var store = ReposStore()
    
    var body: some View {
        NavigationStack {
            if store.repos.isEmpty {
                ProgressView("loading...")
            } else {
                List(store.repos) { repo in
                    NavigationLink(value: repo) {
                        RepoRaw(repo: repo)
                    }
                }
                .navigationTitle("Repositories")
                .navigationDestination(for: Repo.self) { repo in
                    RepoDetailView(repo: repo)
                }
            }
        }
        .task {
            await store.loadRepos()
        }
    }
}

@Observable
@MainActor
class ReposStore {
    private(set) var repos = [Repo]()
    
    func loadRepos() async {
        try! await Task.sleep(nanoseconds: 1_000_000_000) // 1秒待つ
        
        repos = [.mock1, .mock2, .mock3, .mock4, .mock5]
    }
}

#Preview {
    RepoListView()
}
