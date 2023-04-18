//
//  PostCellToolbarButton.swift
//  WeiboApp
//
//  Created by Jiaming Guo on 2023-04-18.
//

import SwiftUI

struct PostCellToolbarButton: View {
	let image: String
	let text: String
	let color: Color
	let action: () -> Void
	
    var body: some View {
		Button {
			action()
		} label: {
			HStack(spacing: 5) {
				Image(systemName: image)
					.resizable()
					.scaledToFit()
					.frame(width: 18, height: 18)
				Text(text)
					.font(.system(size: 15))
			}
		}
		.buttonStyle(BorderlessButtonStyle())
		.foregroundColor(color)
    }
}

struct PostCellToolbarButton_Previews: PreviewProvider {
    static var previews: some View {
		PostCellToolbarButton(image: "heart", text: "点赞", color: .red, action: {})
    }
}
