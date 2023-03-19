//
//  HotSpotList.swift
//  HotSpot
//
//  Created by John Atkinson on 3/19/23.
//

import SwiftUI

struct HotSpotList: View {
    var body: some View {
        NavigationView {
            List(hotspots) { hotspot in
                NavigationLink {
                    HotSpotDetail(hotspot: hotspot)
                } label: {
                    HotSpotRow(hotspot: hotspot)
                }
            }
            .navigationTitle("Local spots")
        }
    }
}

struct hotSpotList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max", "iPad (10th Generation)"], id: \.self) { deviceName in
            HotSpotList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
