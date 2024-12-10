//
//  InfoSection.swift
//  IGSave
//
//  Created by Sameer Qureshi on 2023-06-05.
//

import SwiftUI

struct InfoSection: View {
    var body: some View {
        VStack(spacing: 15){
            Text("Save Instagram Posts & Reels!")
                .font(.headline)
                .fontWeight(.bold) .multilineTextAlignment(.center)
            HStack(spacing: 45){
                Image(systemName: "camera").font(.system(size: 40))
                Image(systemName: "video").font(.system(size: 40))
                Image(systemName: "film").font(.system(size: 40))
            }
            VStack(alignment: .center, spacing: 8){
                Text("Download any Instagram image, video, or reel directly to your iPhone or iPad gallery.")
                    .font(.callout) .multilineTextAlignment(.center)
            }
        }.frame(maxWidth: .infinity).frame(height: 140)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 30, style: .continuous).fill(.ultraThinMaterial)
            ).padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
    }
}

struct InfoSection_Previews: PreviewProvider {
    static var previews: some View {
        InfoSection()
    }
}
