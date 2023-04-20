//
//  PostCell.swift
//  WeiboApp
//
//  Created by Jiaming Guo on 2023-04-16.
//

import SwiftUI

struct PostCell: View {
	let post: Post
	
    var body: some View {
		VStack(alignment: .leading, spacing: 10) {
			HStack(spacing: 5) {
				Image(uiImage: UIImage(named: post.avatar)!)
					.resizable()
					.scaledToFill()
					.frame(width: 50, height: 50)
					.clipShape(Circle())
					.overlay {
						VIPBadge(isVip: post.vip)
							.offset(x: 15, y: 15)
					}
				
				VStack(alignment: .leading, spacing: 5) {
					Text(post.name)
						.font(.system(size: 17))
						.foregroundColor(Color("theme"))
						.lineLimit(1)
					Text(post.date)
						.font(.system(size: 11))
						.foregroundColor(.gray)
				}
				.padding(.leading, 10)
				
				if !post.isFollowed {
					Spacer()
					Button {
						print("Tapped follow btn")
					} label: {
						Text("关注")
							.font(.system(size: 14))
							.foregroundColor(Color("theme"))
							.frame(width: 50, height: 26)
							.overlay {
								RoundedRectangle(cornerRadius: 13)
									.stroke(Color("theme"), lineWidth: 1)
							}
					}
					.buttonStyle(BorderlessButtonStyle())
				}
			}
			
			Text(post.text)
				.multilineTextAlignment(.leading)
				.lineSpacing(3)
				.font(.system(size: 16))
			
			if !post.images.isEmpty {
				PostImageCell(images: post.images, width: UIScreen.main.bounds.width - 30)
			}
			
			Divider()
			
			HStack {
				Spacer()
				PostCellToolbarButton(image: "ellipsis.message", text: post.commentButtonText, color: .black) {
					print("tapped comment button")
				}
				Spacer()
				PostCellToolbarButton(image: "heart", text: post.likeButtonText, color: .black) {
					print("tapped like button")
				}
				Spacer()
			}
			
			Rectangle()
				.padding(.horizontal, -15)
				.frame(height: 10)
				.foregroundColor(Color("grayAccent"))
		}
		.padding(.horizontal, 15)
		.padding(.top, 15)
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
		PostCell(post: POST_LIST.list[0])
    }
}
