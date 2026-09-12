//
//  Repo.swift
//  GitHubClient
//
//  Created by コウスケ on 2026/09/12.
//

import Foundation


struct Repo: Identifiable {
    var id: Int
    var name: String
    var owner: User
}

