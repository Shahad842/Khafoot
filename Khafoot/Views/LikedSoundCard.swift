//
//  LikedSoundCard.swift
//  Khafoot
//
//  Created by Shahad Alhothali on 02/05/1446 AH.
//

import SwiftUI
// LikedSoundCard as a separate view
struct LikedSoundCard: View {
    var sound: SoundModel
    var onTap: () -> Void

    var body: some View {
        ZStack {
            // Background rectangle with a solid color and material effect
            Rectangle()
                .fill(.ultraThickMaterial) // Apply material effect directly on the shape
                .frame(width: 267, height: 320)
                .shadow(radius: 4)
                .overlay {
                    // Background image with a blur effect
                    Image(sound.soundImage)
                        .resizable()
                        .scaledToFill()
                        .blur(radius: 100)
                        .overlay(Color.black.opacity(0.4))
                        .cornerRadius(12) // Match the rectangle’s corner radius
                }
                .cornerRadius(12)
                .edgesIgnoringSafeArea(.all)

            
            VStack(alignment: .leading, spacing: 8) {
                // Sound image on top of the card
                Image(sound.soundImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 235, height: 164) // Adjusted size for a larger display
                    .clipped()
                    .cornerRadius(5)
                    .shadow(radius: 4)
                    .offset(y: -20) // Move the image slightly upward

                
                // Sound title and category
                Text(sound.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .lineLimit(1)
                
                Text(sound.category)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                // Duration
                Text(formatDuration(time: sound.duration))
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding()
        }
        .onTapGesture {
            onTap()
        }
    }
    
    // Helper function to format the duration
    private func formatDuration(time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
}
