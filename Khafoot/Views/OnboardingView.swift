//
//  OnboardingView.swift
//  Khafoot
//
//  Created by Shahad Alhothali on 26/04/1446 AH.
//

import SwiftUI

struct OnboardingView: View {
    @State private var isOnboardingCompleted = UserDefaults.standard.bool(forKey: "OnboardingCompleted")
    @State private var isLoading = false
    
    var body: some View {
        if isOnboardingCompleted {
            MainView()
        } else {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("Welcome to")
                        .font(.system(size: 48, weight: .semibold))
                        .foregroundColor(Color("TextColor"))

                    Text("Khafoot")
                        .font(.system(size: 48, weight: .semibold))
                        .foregroundColor(Color("AccentColor"))
                }
                .padding(.leading, 40)
                .padding(.bottom, 50)
                .padding(.top, 80)
                
                VStack(alignment: .leading, spacing: 20) {
                    FeatureView(imageName: "waveform.and.magnifyingglass", title: "Noise Detection", description: "The app uses advanced technology to monitor\n ambient noise levels, ensuring a relaxing,\n distraction-free experience.", imageWidth: 52.86, imageHeight: 46.77)
                    
                    FeatureView(imageName: "ear.and.waveform", title: "Personalized Meditation", description: "Meditation in the app includes listening to \n nature sounds, which helps promote relaxation \n and calm.", imageWidth: 48, imageHeight: 62.42)
                    
                    FeatureView(imageName: "brain.head.profile", title: "Embrace Slow Living", description: "In the app, embracing the Slow Lifestyle \n encourages you to focus on the present moment, and reduce clutter.", imageWidth: 49, imageHeight: 59)
                }

                .padding(.top, 20)
                
                VStack {
                    HStack {
                        Spacer()
                        Image(systemName: "checkmark.icloud.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 29.46, height: 22.28)
                            .foregroundColor(Color("AccentColor"))

                        Spacer()
                    }
                    
                    Text("Khafoot collects your activity, which is not \nassociated with your Apple ID, in order to \nimprove and personalize Khafoot. Your\n Apple ID may be used to check for news \n subscriptions.")
                        .font(.system(size: 12))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("Neutral40"))

//                        .padding(.top, 20)
//                        .lineLimit(nil) // Allow unlimited lines
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.top, 50)
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        UserDefaults.standard.set(true, forKey: "OnboardingCompleted")
                        isOnboardingCompleted = true
                    }
                }) {
                    Text("Continue")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(Color("ButtonTextColor"))
                        .padding()
                        .frame(width: 279, height: 49)
                        .background(Color("AccentColor"))
                        .cornerRadius(8)
                        .padding(.bottom, 20)
                        .frame(maxWidth: .infinity)
                }
                .padding(.bottom, 50)

            }
            .opacity(isLoading ? 1 : 0)
            .onAppear {
                withAnimation(.easeIn(duration: 1.5)) {
                    isLoading = true
                }
            }
        }
    }
}


struct FeatureView: View {
    let imageName: String
    let title: String
    let description: String
    let imageWidth: CGFloat
    let imageHeight: CGFloat
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: imageWidth, height: imageHeight)
                .foregroundColor(Color("AccentColor"))

            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Color("TextColor"))

                Text(description)
                    .font(.system(size: 12))
                    .foregroundColor(Color("TextColor"))
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(.leading, 40)
    }
}


#Preview {
    OnboardingView()
}
