//
//  Header.swift
//  IGSave
//
//  Created by Sameer Qureshi on 2023-06-05.
//

import SwiftUI

struct Header: View {
    var body: some View {
        VStack{
            VStack(){
                Image("igsave_logo_full").resizable().scaledToFit().padding(EdgeInsets(top: 100, leading: 60, bottom: 0, trailing: 60))
            }.edgesIgnoringSafeArea(.all).frame(maxWidth: .infinity)
        }
    }
    
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
