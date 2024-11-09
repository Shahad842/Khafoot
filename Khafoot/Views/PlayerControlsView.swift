//
//  PlayerControlsView.swift
//  khafootTest1
//
//  Created by Shahad Alhothali on 28/04/1446 AH.
//
import AVFoundation
import Combine
import SwiftUI

import AVFoundation
import Combine
import SwiftUI

// PlayerControlsView
struct PlayerControlsView: View {
    let totalTime: TimeInterval
    @Binding var currentTime: TimeInterval
    @Binding var isPlaying: Bool
    @Binding var volume: Float
    var playAction: () -> Void
    var forwardAction: () -> Void
    var backwardAction: () -> Void
    var viewModel: SoundViewModel

    var body: some View {
        VStack {
            // Slider for current playback time
            HStack {
                GeometryReader { geometry in
                    let sliderWidth = geometry.size.width
                    
                    // Custom track
                    Rectangle()
                        .fill(Color.gray.opacity(0.5))
                        .frame(height: 6.6)
                        .cornerRadius(8)
                    
                    // Progress track
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: CGFloat(currentTime / totalTime) * sliderWidth, height: 6.6)
                        .cornerRadius(8)
                        .animation(.easeInOut(duration: 0.1), value: currentTime) // Smoother animation
                    
                    // Invisible slider for dragging
                    Rectangle()
                        .fill(Color.clear)
                        .contentShape(Rectangle())
                        .gesture(DragGesture(minimumDistance: 0)
                            .onChanged { value in
                                let location = value.location.x
                                let newValue = Double(location / sliderWidth) * totalTime
                                currentTime = min(max(newValue, 0), totalTime) // Clamp the value
                                viewModel.seek(to: currentTime) // Seek in the view model
                            }
                        )
                }
                .frame(height: 20)
            }
            .padding(.horizontal)
            
            HStack {
                Text(timeString(time: currentTime))
                    .font(.system(size: 10.8))
                    .foregroundColor(.white)
                    .padding(.bottom, 1)
                Spacer()
                Text(timeString(time: totalTime))
                    .font(.system(size: 10.8))
                    .foregroundColor(.white)
                    .padding(.bottom, 1)
            }
            Spacer()
            
            HStack(spacing: 60) {
                Button(action: backwardAction) {
                    Image(systemName: "gobackward.15")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 33)
                        .foregroundColor(.white)
                        .padding()
                }
                
                Button(action: playAction) {
                    Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 43, height: 43)
                        .foregroundColor(.white)
                        .animation(nil, value: isPlaying)
                }
                
                Button(action: forwardAction) {
                    Image(systemName: "goforward.15")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 33)
                        .foregroundColor(.white)
                        .padding()
                }
            }
            .padding(.bottom)
            
            // Volume Slider
            HStack {
                Image(systemName: "speaker.fill")
                    .frame(width: 13, height: 16)
                    .foregroundColor(.white)

                GeometryReader { geometry in
                    let sliderWidth = geometry.size.width
                    
                    // Custom track for volume
                    Rectangle()
                        .fill(Color.gray.opacity(0.5))
                        .frame(height: 6.6)
                        .cornerRadius(8)
                    
                    // Progress track for volume
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: CGFloat(volume) * sliderWidth, height: 6.6)
                        .cornerRadius(8)
                        .animation(.easeInOut(duration: 0.1), value: volume)
                    
                    // Invisible slider for dragging
                    Rectangle()
                        .fill(Color.clear)
                        .contentShape(Rectangle())
                        .gesture(DragGesture(minimumDistance: 0)
                            .onChanged { value in
                                let location = value.location.x
                                let newValue = Float(location / sliderWidth)
                                volume = min(max(newValue, 0), 1)
                                viewModel.updateVolume(volume) // Update the view model's volume
                            }
                        )
                }
                .frame(height: 20)
                .padding(.horizontal)
                
                Image(systemName: "speaker.wave.2.fill")
                    .frame(width: 22, height: 16)
                    .foregroundColor(.white)
            }
            Spacer()
            .padding(.horizontal)
        }
        .environment(\.layoutDirection, .leftToRight) // Force LTR layout
    }

    private func timeString(time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}


//import AVFoundation
//import Combine
//import SwiftUI
//
//// PlayerControlsView
//struct PlayerControlsView: View {
//    let totalTime: TimeInterval
//    @Binding var currentTime: TimeInterval
//    @Binding var isPlaying: Bool
//    @Binding var volume: Float
//    var playAction: () -> Void
//    var forwardAction: () -> Void
//    var backwardAction: () -> Void
//    var viewModel: SoundViewModel
//
//    var body: some View {
//        VStack {
//            // Slider for current playback time
//            HStack {
//                GeometryReader { geometry in
//                    let sliderWidth = geometry.size.width
//                    
//                    // Custom track
//                    Rectangle()
//                        .fill(Color.gray.opacity(0.5))
//                        .frame(height: 6.6)
//                        .cornerRadius(8)
//                    
//                    // Progress track
//                    Rectangle()
//                        .fill(Color.white)
//                        .frame(width: CGFloat(currentTime / totalTime) * sliderWidth, height: 6.6)
//                        .cornerRadius(8)
//                        .animation(.easeInOut(duration: 0.1), value: currentTime) // Reduced duration for smoother animation
//                    
//                    // Invisible slider for dragging
//                    Rectangle()
//                        .fill(Color.clear)
//                        .contentShape(Rectangle()) // Make the whole rectangle tappable
//                        .gesture(DragGesture(minimumDistance: 0) // Add gesture to handle dragging
//                            .onChanged { value in
//                                let location = value.location.x
//                                let newValue = Double(location / sliderWidth) * totalTime
//                                currentTime = min(max(newValue, 0), totalTime) // Clamp the value
//                                viewModel.seek(to: currentTime) // Seek in the view model
//                            }
//                        )
//                }
//                .frame(height: 20) // Adjust height for the geometry reader
//            }
//            .padding(.horizontal) // Add horizontal padding
//
//            HStack {
//                Text(timeString(time: currentTime))
//                    .font(.system(size: 10.8))
//                    .foregroundColor(.white)
//                    .padding(.bottom, 1)
//                Spacer()
//                Text(timeString(time: totalTime))
//                    .font(.system(size: 10.8))
//                    .foregroundColor(.white)
//                    .padding(.bottom, 1)
//            }
//            Spacer()
//            
//            HStack(spacing: 60) {
//                Button(action: backwardAction) {
//                    Image(systemName: "gobackward.15")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 32, height: 33)
//                        .foregroundColor(.white)
//                        .padding()
//                }
//                
//                Button(action: playAction) {
//                    Image(systemName: isPlaying ? "pause.fill" : "play.fill")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 43, height: 43)
//                        .foregroundColor(.white)
////                        .padding()
//                        .animation(nil, value: isPlaying) // Disable animation on this state change
//
//                }
//                
//                Button(action: forwardAction) {
//                    Image(systemName: "goforward.15")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 32, height: 33)
//                        .foregroundColor(.white)
//                        .padding()
//                }
//            }
//            .padding(.bottom)
//
//            // Volume Slider
//            HStack {
//                Image(systemName: "speaker.fill")
//                    .frame(width: 13, height: 16)
//                    .foregroundColor(.white)
//
//                GeometryReader { geometry in
//                    let sliderWidth = geometry.size.width
//                    
//                    // Custom track for volume
//                    Rectangle()
//                        .fill(Color.gray.opacity(0.5))
//                        .frame(height: 6.6)
//                        .cornerRadius(8)
//                    
//                    // Progress track for volume
//                    Rectangle()
//                        .fill(Color.white)
//                        .frame(width: CGFloat(volume) * sliderWidth, height: 6.6)
//                        .cornerRadius(8)
//                        .animation(.easeInOut(duration: 0.1), value: volume) // Reduced duration for smoother animation
//                    
//                    // Invisible slider for dragging
//                    Rectangle()
//                        .fill(Color.clear)
//                        .contentShape(Rectangle()) // Make the whole rectangle tappable
//                        .gesture(DragGesture(minimumDistance: 0) // Add gesture to handle dragging
//                            .onChanged { value in
//                                let location = value.location.x
//                                let newValue = Float(location / sliderWidth)
//                                volume = min(max(newValue, 0), 1) // Clamp the value
//                                viewModel.updateVolume(volume) // Update the view model's volume
//                            }
//                        )
//                }
//                .frame(height: 20)
//                .padding(.top) // Add horizontal padding
//
//                Image(systemName: "speaker.wave.2.fill")
//                    .frame(width: 22, height: 16)
//                    .foregroundColor(.white)
//            }
//            Spacer()
//            .padding(.horizontal)
//        }
//    }
//
//    private func timeString(time: TimeInterval) -> String {
//        let minutes = Int(time) / 60
//        let seconds = Int(time) % 60
//        return String(format: "%02d:%02d", minutes, seconds)
//    }
//}
