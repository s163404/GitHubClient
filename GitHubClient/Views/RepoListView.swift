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
        let url = URL(string: "https://api.github.com/orgs/mixigroup/repos")!

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = [
            "Accept": "application/vnd.github+json"
        ]
        // GitHub API のリクエスト数制限(60回/h)回避のためのキャッシュ設定 ※研修内容とは直接関係ありません
        urlRequest.cachePolicy = .returnCacheDataElseLoad

        let (data, _) = try! await URLSession.shared.data(for: urlRequest)
        // デコード処理
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        repos = try! decoder.decode([Repo].self, from: data)
    }
}

#Preview {
    RepoListView()
}
