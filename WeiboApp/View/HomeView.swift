//
//  HomeView.swift
//  WeiboApp
//
//  Created by Jiaming Guo on 2023-04-25.
//

import SwiftUI

struct HomeView: View {
	
	init() {
		UITableView.appearance().separatorStyle = .none
		UITableViewCell.appearance().selectionStyle = .none
	}
	
    var body: some View {
		NavigationView {
			ScrollView(.horizontal, showsIndicators: false) {
				HStack(spacing: 0) {
					PostListView(category: .recommend)
						.frame(width: UIScreen.main.bounds.width)
					PostListView(category: .hot)
						.frame(width: UIScreen.main.bounds.width)
				}
			}
			.toolbar {
				HomeNavigationBar()
			}
			.navigationTitle("首页")
			.navigationBarTitleDisplayMode(.inline)
			.edgesIgnoringSafeArea(.bottom)
		}
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
