//
//  SplashScreen.swift
//  Khafoot
//
//  Created by Shahad Alhothali on 26/04/1446 AH.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isLoading = false
    @State var isActive: Bool = false
    
    var body: some View {
        if isActive {
            OnboardingView()
        } else {
            ZStack {
                VStack {
                    Spacer()

                    Image("SplashImage")
                        .resizable()
                        .scaledToFit()
                        .multilineTextAlignment(.center)
                        .frame(width: 374.26, height: 250)
                        .opacity(isLoading ? 1 : 0)

                    Text("Khafoot")
                        .font(.system(size: 45.71, weight: .semibold))
                        .foregroundColor(Color("AccentColor"))
                        .opacity(isLoading ? 1 : 0)

                    Text("Stillness for inner peace")
                        .font(.system(size: 15.24))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("TextColor"))
                        .lineSpacing(2)
                        .frame(width: 360, height: 140, alignment: .top)
                        .padding()
                        .offset(y: -30)
                        .opacity(isLoading ? 1 : 0)

                    Spacer()
                }
                .onAppear {
                    withAnimation(.easeIn(duration: 2)) {
                        isLoading = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                Color("SplashColor")
                    .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    SplashScreen()
}
