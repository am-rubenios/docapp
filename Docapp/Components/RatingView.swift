//
//  RatingView.swift
//  Docapp
//
//  Created by Ruben on 22.04.26.
//

import SwiftUI

struct RatingView: View {
    let rating: Double
    
    var body: some View {
        HStack(spacing: 2) {
            ForEach(1...5, id: \.self) { star in
                Image(star <= Int(rating.rounded()) ? "star_filled" : "star_empty")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 12, height: 12)
            }
        }
    }
}
