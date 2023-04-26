//
//  HomeNavigationBar.swift
//  WeiboApp
//
//  Created by Jiaming Guo on 2023-04-25.
//

import SwiftUI

private let LABEL_WIDTH: CGFloat = 60
private let BTN_HEIGHT: CGFloat = 24

struct HomeNavigationBar: View {
	@State private var leftPercent: CGFloat = 0 // 0 for left, 1 for right
	
    var body: some View {
		HStack(alignment: .top, spacing: 0) {
			Button {
				print("Clicked camera button")
			} label: {
				Image(systemName: "camera")
					.frame(width: BTN_HEIGHT, height: BTN_HEIGHT)
					.padding(.top, 5)
					.padding(.horizontal, 15)
					.foregroundColor(.black)
			}
			
			Spacer()
			
			VStack(spacing: 3) {
				HStack {
					Text("推荐")
						.bold()
						.frame(width: LABEL_WIDTH, height: BTN_HEIGHT)
						.padding(.top, 5)
						.opacity(1 - Double(leftPercent) * 0.5)
						.onTapGesture {
							withAnimation {
								leftPercent = 0
							}
						}
					Spacer()
					Text("热门")
						.bold()
						.frame(width: LABEL_WIDTH, height: BTN_HEIGHT)
						.padding(.top, 5)
						.opacity(0.5 + Double(leftPercent) * 0.5)
						.onTapGesture {
							withAnimation {
								leftPercent = 1
							}
						}
				}
				.font(.system(size: 20))
				
				RoundedRectangle(cornerRadius: 2)
					.foregroundColor(Color("theme"))
					.frame(width: 30, height: 4)
					.offset(x: UIScreen.main.bounds.width * 0.5 * (leftPercent - 0.5) + LABEL_WIDTH * (0.5 - leftPercent))
			}
			.frame(width: UIScreen.main.bounds.width * 0.5)
			
			Spacer()
			
			Button {
				print("Clicked add button")
			} label: {
				Image(systemName: "plus.circle.fill")
					.frame(width: BTN_HEIGHT, height: BTN_HEIGHT)
					.padding(.top, 5)
					.padding(.horizontal, 15)
					.foregroundColor(Color("theme"))
			}
		}
		.frame(width: UIScreen.main.bounds.width)
    }
}

struct HomeNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
		HomeNavigationBar()
    }
}
