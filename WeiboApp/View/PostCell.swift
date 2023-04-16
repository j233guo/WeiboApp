//
//  PostCell.swift
//  WeiboApp
//
//  Created by Jiaming Guo on 2023-04-16.
//

import SwiftUI

struct PostCell: View {
    var body: some View {
		HStack(spacing: 5) {
			Image(uiImage: UIImage(named: "8697cf1ely8gashxj3b09j20u00u040v.jpg")!)
				.resizable()
				.scaledToFill()
				.frame(width: 50, height: 50)
				.clipShape(Circle())
				.overlay {
					VIPBadge()
						.offset(x: 15, y: 15)
				}
			
			VStack(alignment: .leading, spacing: 5) {
				Text("用户昵称")
					.font(.system(size: 16))
					.foregroundColor(Color("theme"))
					.lineLimit(1)
				Text("2023-01-01 00:00")
					.font(.system(size: 11))
					.foregroundColor(.gray)
			}
			.padding(.leading, 10)
			
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
		}
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell()
    }
}
