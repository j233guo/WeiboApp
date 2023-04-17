//
//  Post.swift
//  WeiboApp
//
//  Created by Jiaming Guo on 2023-04-17.
//

import Foundation

struct PostList: Codable {
	var list: [Post]
}

struct Post: Codable {
	let id: Int
	let avatar: String
	let vip: Bool
	let name: String
	let date: String
	var isFollowed: Bool
	let text: String
	let images: [String]
	var commentCount: Int
	var likeCount: Int
	var isLiked: Bool
}

func loadPostListData(_ fileName: String) -> PostList {
	guard let url = Bundle.main.url(forResource: fileName, withExtension: nil) else {
		fatalError("Cannot find \(fileName)")
	}
	guard let data = try? Data(contentsOf: url) else {
		fatalError("Cannot load \(url)")
	}
	guard let list = try? JSONDecoder().decode(PostList.self, from: data) else {
		fatalError("Cannot parse data")
	}
	return list
}

let POSTLIST = loadPostListData("PostListData_recommend_1.json")
