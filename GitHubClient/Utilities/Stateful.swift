//
//  Stateful.swift
//  GitHubClient
//
//  Created by コウスケ on 2026/11/23.
//
import Foundation

enum Stateful<Value> {
    // 読み込み中
    case loading
    // 読み込み失敗、エラーを保持
    case failed(Error)
    // 読み込み完了、読み込まれた値を保持
    case loaded(Value)
}
