//
//  VIPBadge.swift
//  WeiboApp
//
//  Created by Jiaming Guo on 2023-04-16.
//

import SwiftUI

struct VIPBadge: View {
    var body: some View {
		Text("V")
			.bold()
			.font(.system(size: 11))
			.frame(width: 15, height: 15)
			.foregroundColor(.yellow)
			.background(Color.red)
			.clipShape(Circle())
			.overlay {
				RoundedRectangle(cornerRadius: 7.5)
					.stroke(Color.white)
			}
    }
}

struct VIPBadge_Previews: PreviewProvider {
    static var previews: some View {
        VIPBadge()
    }
}
