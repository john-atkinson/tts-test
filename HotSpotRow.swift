//
//  HotSpotRow.swift
//  HotSpot
//
//  Created by John Atkinson on 3/19/23.
//

import SwiftUI

struct HotSpotRow: View {
    var hotspot: HotSpot

    var body: some View {
        HStack {
            hotspot.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(hotspot.name)

            Spacer()
        }
    }
}

struct HotSpotRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HotSpotRow(hotspot: hotspots[0])
            HotSpotRow(hotspot: hotspots[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
