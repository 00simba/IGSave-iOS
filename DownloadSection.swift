//
//  DownloadSection.swift
//  IGSave
//
//  Created by Sameer Qureshi on 2023-06-05.
//

import SwiftUI

struct DownloadSection: View {
    
    @State var url = ""
    @State var tempUrl = ""
    @StateObject var viewModel = ViewModel()
    @State var tappedDownload = false
    
    var body: some View {
     
        VStack{
            Text("Enter Instagram Link And Tap Download!") .multilineTextAlignment(.center).font(.system(size: 18, weight:.medium))
            TextField("Paste URL Here", text: $url).padding(.all).overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(Color.gray, lineWidth: 1.1)
            ).padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                Button {
                    viewModel.postAPI(url: url)
                    tempUrl = url
                    url = ""
                    self.tappedDownload.toggle()
                } label: {
                    Text("Download!").font(.system(size: 16, weight: .medium))
            }.buttonStyle(.borderedProminent).tint(.purple)
        }.padding().edgesIgnoringSafeArea(.all).navigationDestination(isPresented: $tappedDownload) {
            DownloadView(viewModel: self.viewModel, tappedDownload: self.$tappedDownload, url: self.$tempUrl)
        }
    }

    struct DownloadSection_Previews: PreviewProvider {
        static var previews: some View {
            DownloadSection()
        }
    }
}
