//
//  LikedSoundsView.swift
//  Khafoot
//
//  Created by Shahad Alhothali on 02/05/1446 AH.
//

import SwiftUI

struct LikedSoundsView: View {
    @ObservedObject var viewModel: SoundViewModel
    var onSoundTap: (SoundModel) -> Void // Closure to handle navigation

    var body: some View {
        VStack(alignment: .leading) {
            Text("Liked Sounds")
                .font(.title)
                .fontWeight(.bold)
                .padding(.leading)
                .foregroundColor(Color("TextColor"))

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10
                ) {
                    ForEach(viewModel.likedSounds) { sound in
                        LikedSoundCard(sound: sound, onTap: { onSoundTap(sound) })
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.top)
    }
}

