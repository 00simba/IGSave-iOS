//
//  StepsSection.swift
//  IGSave
//
//  Created by Sameer Qureshi on 2023-06-06.
//

import SwiftUI

struct StepsSection: View {
    var body: some View {
        
        VStack(alignment: .leading, spacing: 15){
            HStack(spacing: 10){
                Image(systemName: "1.circle").font(.system(size: 25))
                Text("Copy the Instagram Post Link")
            }
            HStack(spacing: 10){
                Image(systemName: "2.circle").font(.system(size: 25))
                Text("Paste into the textbox above")
            }
            HStack(spacing: 10){
                Image(systemName: "3.circle").font(.system(size: 25))
                Text("Tap 'Download' and Save!")
            }
        }.frame(maxWidth: .infinity).frame(height: 120)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 30, style: .continuous).fill(.ultraThinMaterial)
            ).padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
        
    }
}
        

struct StepsSection_Previews: PreviewProvider {
    static var previews: some View {
        StepsSection()
    }
}
