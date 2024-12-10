//
//  MenuBar.swift
//  IGSave
//
//  Created by Sameer Qureshi on 2023-06-07.
//

import SwiftUI

struct MenuBar: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var tappedHome: Bool;
    @Binding var tappedFavorite: Bool;
    @Binding var tappedInfo: Bool;
    @Binding var tappedMore: Bool;
    
    var body: some View {
        VStack(spacing: 15){
            HStack(spacing: 50){
                VStack{
                    Image(systemName: "house.fill").foregroundColor(tappedHome ? (colorScheme == .dark ? .black : .white) : (colorScheme == .dark ? .white : .black)).font(.system(size: 25)).onTapGesture {
                        tappedHome = true
                        tappedFavorite = false
                        tappedInfo = false
                        tappedMore = false
                    }
                }
                VStack{
                    Image(systemName: "heart.fill").foregroundColor(tappedFavorite ? (colorScheme == .dark ? .black : .white) : (colorScheme == .dark ? .white : .black)).font(.system(size: 25)).onTapGesture {
                        tappedHome = false
                        tappedFavorite = true
                        tappedInfo = false
                        tappedMore = false
                    }
                }
                
                /*VStack{
                    Image(systemName: "info.circle.fill").foregroundColor(tappedInfo ? (colorScheme == .dark ? .black : .white) : (colorScheme == .dark ? .white : .black)).font(.system(size: 25)).onTapGesture {
                        tappedHome = false
                        tappedFavorite = false
                        tappedInfo = true
                        tappedMore = false
                    }
                }*/
                
                VStack{
                    Image(systemName: "ellipsis").foregroundColor(tappedMore ? (colorScheme == .dark ? .black : .white) : (colorScheme == .dark ? .white : .black)).font(.system(size: 25)).onTapGesture {
                        tappedHome = false
                        tappedFavorite = false
                        tappedInfo = false
                        tappedMore = true
                    }
                }
            }
        }.frame(maxWidth: .infinity).frame(height: 35)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 30, style: .continuous).fill(.ultraThinMaterial)
            ).padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
    }
}

struct MenuBar_Previews: PreviewProvider {
    static var previews: some View {
        MenuBar(tappedHome: .constant(false), tappedFavorite: .constant(true), tappedInfo: .constant(false), tappedMore: .constant(false))
    }
}
