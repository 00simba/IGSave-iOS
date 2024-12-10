//
//  InfoView.swift
//  IGSave
//
//  Created by Sameer Qureshi on 2023-06-07.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        Text("FAQs").font(.system(size: 32, weight:.bold)).frame(maxWidth: .infinity, alignment: .leading).padding()
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
