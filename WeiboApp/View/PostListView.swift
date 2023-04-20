//
//  PostListView.swift
//  WeiboApp
//
//  Created by Jiaming Guo on 2023-04-18.
//

import SwiftUI

struct PostListView: View {
	
	init() {
		UITableView.appearance().separatorStyle = .none
		UITableViewCell.appearance().selectionStyle = .none
	}
	
    var body: some View {
		List {
			ForEach(POST_LIST.list) { post in
				ZStack {
					PostCell(post: post)
					NavigationLink(destination: PostDetailView(post: post)) {
						EmptyView()
					}
				}
				.listRowInsets(EdgeInsets())
			}
		}
		.listStyle(.plain)
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
		NavigationView {
			PostListView()
				.navigationTitle("title")
				.navigationBarHidden(true)
		}
    }
}
