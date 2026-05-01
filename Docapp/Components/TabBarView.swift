//
//  TabBarView.swift
//  Docapp
//
//  Created by Ruben on 22.04.26.
//

import SwiftUI

struct TabBarView: View {
    @Binding var selectedTab: TabItem
    @State private var chatBadgeCount: Int = 1
    
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(Color.appGrey.opacity(0.5))
                .frame(height: 1)
            
            HStack(alignment: .bottom, spacing: 36) {
                ForEach(TabItem.allCases, id: \.self) { tab in
                    Button {
                        withAnimation(.snappy(duration: 0.2)) {
                            selectedTab = tab
                        }
                    } label: {
                        VStack(spacing: 5) {
                            Image(tab.icon)
                                .frame(width: 32, height: 32)
                                .foregroundStyle(selectedTab == tab ? Color.appPink : Color.appDarkGray)
                                .overlay(alignment: .topTrailing) {
                                    if tab == .chat && chatBadgeCount > 0 {
                                        ZStack {
                                            Circle()
                                                .frame(width: 22)
                                                .foregroundStyle(.white)
                                            Text("\(chatBadgeCount)")
                                                .font(.system(size: 10))
                                                .foregroundStyle(.white)
                                                .frame(minWidth: 17, minHeight: 17)
                                                .background(Color.appPink)
                                                .clipShape(Circle())
                                        }
                                        .offset(x: 4, y: -2)
                                    }
                                }
                            
                            Text(tab.title)
                                .font(.system(size: 12))
                                .foregroundStyle(Color.appDarkGray)
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.top, 17)
            .padding(.bottom, 8)
        }
        .background(Color.white)
    }
}
