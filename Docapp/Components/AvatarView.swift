//
//  AvatarView.swift
//  Docapp
//
//  Created by Ruben on 22.04.26.
//

import SwiftUI

struct AvatarView: View {
    let url: String?
    let size: CGFloat
    
    var body: some View {
        Group {
            if let url, let imageUrl = URL(string: url) {
                AsyncImage(url: imageUrl) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
            } else {
                Circle()
                    .fill(Color.appGrey)
                    .overlay(
                        Image(systemName: "person.fill")
                            .foregroundColor(Color.appDarkGray)
                    )
            }
        }
        .frame(width: size, height: size)
        .clipShape(Circle())
    }
}
