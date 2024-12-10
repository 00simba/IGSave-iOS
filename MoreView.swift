//
//  MoreView.swift
//  IGSave
//
//  Created by Sameer Qureshi on 2023-06-07.
//

import SwiftUI

struct MoreView: View {
    var body: some View {
        Text("Options").font(.system(size: 32, weight:.bold)).frame(maxWidth: .infinity, alignment: .leading).padding()
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView()
    }
}
