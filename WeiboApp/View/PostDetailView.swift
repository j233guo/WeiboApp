//
//  PostDetailView.swift
//  WeiboApp
//
//  Created by Jiaming Guo on 2023-04-20.
//

import SwiftUI

struct PostDetailView: View {
	let post: Post
	
    var body: some View {
		List {
			VStack {
				PostCell(post: post)
				HStack {
					Text("评论 (\(post.commentCount))")
						.frame(width: 100, height: 32)
					Spacer()
				}
				.padding(.leading, 15)
				Divider()
			}
			.listRowInsets(EdgeInsets())
			
			if post.commentCount >= 1 {
				ForEach(1...post.commentCount, id: \.self) { i in
					Text("Comment \(i)")
				}
			}
		}
		.listStyle(.inset)
		.navigationTitle("详情")
		.navigationBarTitleDisplayMode(.inline)
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
		PostDetailView(post: POST_LIST.list[0])
    }
}
