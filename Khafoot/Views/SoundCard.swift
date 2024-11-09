//
//  SoundCard.swift
//  khafootTest1
//
//  Created by Shahad Alhothali on 28/04/1446 AH.
//

import SwiftUI

// SoundCard
struct SoundCard: View {
    @StateObject var viewModel = SoundViewModel()
    var sound: SoundModel

    var body: some View {
        VStack (alignment: .leading) {
            Image(sound.soundImage) // Make sure the image is available in assets
                .resizable()
                .scaledToFit()
                .frame(width: 174, height: 174) // Resized image
                .cornerRadius(10)
            
            Text(sound.title)
                .font(.headline)
                .fontWeight(.light)
                .foregroundColor(Color("TextColor"))
                .multilineTextAlignment(.leading)
                .padding(2)
            
            // Display sound duration using the view model
                       Text(viewModel.formatDuration(time: sound.duration))
                           .font(.subheadline)
                           .foregroundColor(.gray)
                           .multilineTextAlignment(.leading)
                           .padding(.top, 1)
        }
        .padding()
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}
