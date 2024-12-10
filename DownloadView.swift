//
//  DownloadView.swift
//  IGSave
//
//  Created by Sameer Qureshi on 2023-06-05.
//

import SwiftUI

struct DownloadView: View {
    
    @ObservedObject var viewModel : ViewModel
    @Binding var tappedDownload: Bool
    @State public var tappedAdd = false
    @Binding var url: String
    
    var body: some View {
        
        ScrollView{
            VStack{
                HStack{
                    Text(viewModel.Posts.isEmpty ? "Please Wait..." : "")
                }.frame(maxWidth: .infinity, alignment: .leading)
                VStack{
                    if(!viewModel.Posts.isEmpty){
                        Button {
                            self.tappedAdd.toggle()
                        } label: {
                            Text("Add To Favorite").font(.system(size: 16, weight: .medium))
                        }.buttonStyle(.borderedProminent).tint(.purple).padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                        
                    }
                    ForEach(viewModel.Posts) { Post in
                        let image = UIImage(data: Data(base64Encoded: Post.base64.replacingOccurrences(of: "data:image/jpeg;base64,", with: "")) ?? Data())!
                        Image(uiImage: image).resizable().aspectRatio(contentMode: .fill).cornerRadius(10)
                        if Post.url.contains(".mp4?"){
                            VStack{
                                Button {
                                    saveVideo(vidUrl: Post.url)
                                } label: {
                                    Text("Save Video").font(.system(size: 16, weight: .medium))
                                }
                            }.buttonStyle(.borderedProminent).tint(.purple).padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                        }
                        else{
                            VStack{
                                Button {
                                    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                                } label: {
                                    Text("Save Image").font(.system(size: 16, weight: .medium))
                                }.buttonStyle(.borderedProminent).tint(.purple).padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                            }
                        }
                    }
                }
            }
        }.padding().navigationDestination(isPresented: $tappedAdd){
            SelectView(viewModel: viewModel, tappedAdd: $tappedAdd, url: $url)
        }
    }
}
