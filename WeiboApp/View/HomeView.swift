//
//  HomeView.swift
//  WeiboApp
//
//  Created by Jiaming Guo on 2023-04-25.
//

import SwiftUI

struct HomeView: View {
	@State private var leftPercent: CGFloat = 0
	
	init() {
		UITableView.appearance().separatorStyle = .none
		UITableViewCell.appearance().selectionStyle = .none
	}
	
    var body: some View {
		NavigationView {
			GeometryReader { geo in
				HScrollViewController(pageWidth: geo.size.width, contentSize: CGSize(width: geo.size.width * 2, height: geo.size.height), leftPercent: $leftPercent) {
					HStack(spacing: 0) {
						PostListView(category: .recommend)
							.frame(width: UIScreen.main.bounds.width)
						PostListView(category: .hot)
							.frame(width: UIScreen.main.bounds.width)
					}
				}
			}
			.toolbar {
				HomeNavigationBar(leftPercent: $leftPercent)
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
