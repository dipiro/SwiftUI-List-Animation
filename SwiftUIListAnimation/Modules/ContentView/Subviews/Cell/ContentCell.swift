//
//  ContentCell.swift
//  SwiftUIListAnimation
//
//  Created by piro2 on 8/5/24.
//

import SwiftUI

struct ContentCell: View {
    var chat: ChatModel
    
    // MARK: - Body
    var body: some View {
        HStack {
            HStack {
                Image(chat.image)
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: .infinity))
                    .frame(width: 46, height: 46)
                    .aspectRatio(contentMode: .fit)
                VStack(alignment: .leading) {
                    Text(chat.name)
                        .font(.headline)
                        .bold()
                    Text(chat.message)
                        .font(.callout)
                        .foregroundStyle(.black.opacity(0.7))
                }
                Spacer()
                VStack {
                    Text(chat.time)
                        .font(.footnote)
                        .foregroundStyle(.black.opacity(0.7))
                }
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 14)
        }
        .background(.blue.opacity(0.2), in: .rect(cornerRadius: .infinity))
    }
}
