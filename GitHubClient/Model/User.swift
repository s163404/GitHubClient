//
//  User.swift
//  GitHubClient
//
//  Created by コウスケ on 2026/09/12.
//

import Foundation

struct User: Hashable, Decodable {
    var name: String
    
    private enum CodingKeys: String, CodingKey {
        case name = "login"
    }
}
