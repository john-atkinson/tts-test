//
//  HotSpotDetail.swift
//  HotSpot
//
//  Created by John Atkinson on 3/19/23.
//

import SwiftUI
import AVFoundation

let avSpeechSynthesizer = AVSpeechSynthesizer()

struct HotSpotDetail: View {
    func getUtterance(_ speechString: String) -> AVSpeechUtterance {
      let utterance = AVSpeechUtterance(string: speechString)
      return utterance
    }

    func speechTest(_ hotspot: HotSpot) {
        avSpeechSynthesizer.speak(getUtterance(hotspot.description))
    }
    
    struct BlueButton: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding()
                .background(Color(red: 0, green: 0.5, blue: 0))
                .foregroundColor(.white)
                .clipShape(Capsule())
        }
    }
    
    var hotspot: HotSpot
    
    var body: some View {
        ScrollView {
            MapView(coordinate: hotspot.locationCoordinate)
                .frame(height: 300)
            
            CircleImage(image: hotspot.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text(hotspot.name)
                    .font(.title)
                HStack {
                    Text(hotspot.park)
                    Spacer()
                    Text(hotspot.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)

                Divider()

                Text("About \(hotspot.name)")
                    .font(.title2)
                Text(hotspot.description)

                HStack {
                    Button {
                        self.speechTest(hotspot)
                        print("Play button was tapped")
                    } label: {
                        Label("Play Description", systemImage: "play")
                    }
                    .buttonStyle(BlueButton())
                    
                    Spacer()
                    
                    Button {
                        avSpeechSynthesizer.stopSpeaking(at: .word)
                        print("Stop button was tapped")
                    } label: {
                        Label("Stop Playback", systemImage: "stop")
                    }
                    .buttonStyle(BlueButton())
                }
            }
            .padding()
        }
        .navigationTitle(hotspot.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct HotSpotDetail_Previews: PreviewProvider {
    static var previews: some View {
        HotSpotDetail(hotspot: hotspots[2])
    }
}
