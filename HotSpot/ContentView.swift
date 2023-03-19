//
//  ContentView.swift
//  tts-test
//
//  Created by John Atkinson on 3/11/23.
//

import SwiftUI
import AVFoundation

let avSpeechSynthesizer = AVSpeechSynthesizer()

struct ContentView: View {
    func getUtterance(_ speechString: String) -> AVSpeechUtterance {
      let utterance = AVSpeechUtterance(string: speechString)
      return utterance
    }

    func speechTest() {
        //avSpeechSynthesizer.speak(getUtterance("Organ Pipe Cactus National Monument is a U.S. national monument and UNESCO biosphere reserve located in extreme southern Arizona that shares a border with the Mexican state of Sonora. The park is the only place in the United States where the senita and organ pipe cactus grow wild.[citation needed] Along with this species, many other types of cacti and other desert flora native to the Yuma Desert section of the Sonoran Desert region grow in the park. Organ Pipe Cactus National Monument is 517 sq mi (1,340 km2) in size. In 1976 the monument was declared a Biosphere Reserve by UNESCO, and in 1977 95% of Organ Pipe Cactus was declared a wilderness area."))
        avSpeechSynthesizer.speak(getUtterance("Joshua Tree National Park is an American national park in southeastern California, east of San Bernardino and Los Angeles and north of Palm Springs. It is named after the Joshua trees (Yucca brevifolia) native to the Mojave Desert. Originally declared a national monument in 1936, Joshua Tree was redesignated as a national park in 1994 when the U.S. Congress passed the California Desert Protection Act.[4] Encompassing a total of 795,156 acres (1,242.4 sq mi; 3,217.9 km2)[2] – slightly larger than the state of Rhode Island – the park includes 429,690 acres (671.4 sq mi; 1,738.9 km2) of designated wilderness. Straddling San Bernardino and Riverside Counties, the park includes parts of two deserts, each an ecosystem whose characteristics are determined primarily by elevation: the higher Mojave Desert and the lower Colorado Desert. The Little San Bernardino Mountains traverse the southwest edge of the park."))
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
    
    var body: some View {
        VStack {
            MapView()
                .frame(height: 300)
            
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text("Green Turtle")
                    .font(.title)
                HStack {
                    Text("Joshua Tree National Park")
                    Spacer()
                    Text("California")
                }
                .font(.subheadline)
                .foregroundColor(.secondary)

                Divider()

                Text("About Turtle Rock")
                    .font(.title2)
                Text("Descriptive text goes here.")

                HStack {
                    Button {
                        self.speechTest()
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
            .onAppear {
                //self.speechTest()     // 3)
            }
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



