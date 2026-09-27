//
//  ExtractedView.swift
//  GitHubClient
//
//  Created by コウスケ on 2026/09/12.
//
import SwiftUI

struct RepoRaw: View {
    let repo: Repo
    
    var body: some View {
        HStack {
            Image(.githubMark)
                .resizable()
                .frame(width: 44.0, height: 44.0)
            VStack(alignment: .leading){
                Text(repo.owner.name)
                    .font(.caption)
                Text(repo.name)
                    .font(.body)
                    .fontWeight(.semibold)
            }
            
        }
    }
}
