//
//  PostImageCell.swift
//  WeiboApp
//
//  Created by Jiaming Guo on 2023-04-20.
//

import SwiftUI

struct PostImageCell: View {
	let images: [String]
	let width: CGFloat
	
    var body: some View {
		Group {
			if images.count == 1 {
				Image(uiImage: UIImage(named: images[0])!)
					.resizable()
					.scaledToFill()
					.frame(width: width, height: width * 0.75)
					.clipped()
			} else if images.count == 2 || images.count == 3 {
				PostImageCellRow(images: images, width: width)
			} else if images.count == 4 {
				VStack(spacing: 5) {
					PostImageCellRow(images: Array(images[0...1]), width: width)
					PostImageCellRow(images: Array(images[2...3]), width: width)
				}
			} else if images.count == 5 {
				VStack(spacing: 5) {
					PostImageCellRow(images: Array(images[0...1]), width: width)
					PostImageCellRow(images: Array(images[2...4]), width: width)
				}
			} else if images.count == 6 {
				VStack(spacing: 5) {
					PostImageCellRow(images: Array(images[0...2]), width: width)
					PostImageCellRow(images: Array(images[3...5]), width: width)
				}
			}
		}
    }
}

struct PostImageCellRow: View {
	let images: [String]
	let width: CGFloat
	
	var body: some View {
		HStack(spacing: 5) {
			ForEach(images, id: \.self) { i in
				Image(uiImage: UIImage(named: i)!)
					.resizable()
					.scaledToFill()
					.frame(width: (self.width - 5 * CGFloat(self.images.count - 1)) / CGFloat(self.images.count),
						   height: (self.width - 5 * CGFloat(self.images.count - 1)) / CGFloat(self.images.count))
					.clipped()
			}
		}
	}
}

struct PostImageCell_Previews: PreviewProvider {
    static var previews: some View {
		let images = POST_LIST.list[0].images
		let width = UIScreen.main.bounds.width - 30
		return Group {
			PostImageCell(images: Array(images[0...0]), width: width)
			PostImageCell(images: Array(images[0...1]), width: width)
			PostImageCell(images: Array(images[0...2]), width: width)
			PostImageCell(images: Array(images[0...3]), width: width)
			PostImageCell(images: Array(images[0...4]), width: width)
			PostImageCell(images: Array(images[0...5]), width: width)
		}
		.previewLayout(.fixed(width: width, height: 300))
    }
}
