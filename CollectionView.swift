//
//  AlbumView.swift
//  IGSave
//
//  Created by Sameer Qureshi on 2023-07-17.
//

import SwiftUI

struct CollectionView: View {
    
    @Binding var tappedCollection: Bool
    @Binding var collectionPosts: Array<PostObject>
    @State var isPresented = false
    @StateObject var viewModel = ViewModel()
    @State var tappedDownload = false
    @State var url = ""
    
    let items = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        
        ScrollView(.vertical){
            LazyVGrid(columns: items) {
                
                ForEach(collectionPosts){ post in
                    VStack{
                        let image = UIImage(data: Data(base64Encoded: post.base64.replacingOccurrences(of: "data:image/jpeg;base64,", with: "")) ?? Data())!
                        Image(uiImage: image).resizable().aspectRatio(contentMode: .fill).cornerRadius(10).onTapGesture {
                            isPresented = !isPresented
                        }.confirmationDialog("Testing", isPresented: $isPresented){
                            Button("Download"){
                                viewModel.postAPI(url: post.url)
                                tappedDownload = !tappedDownload
                                url = post.url
                            }
                            Button("Delete") {
                                var index = 0
                                for item in collectionPosts{
                                    if(item.id == post.id && item.base64 == post.base64 && post.url == post.url){
                                        break;
                                    }
                                    index = index + 1
                                }
                                collectionPosts.remove(at: index)
                            }
                        }
                    }
                }
            }.padding()
        }.navigationDestination(isPresented: $tappedDownload) {
            DownloadView(viewModel: self.viewModel, tappedDownload: self.$tappedDownload, url: self.$url)
        }
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView(tappedCollection: .constant(true), collectionPosts: .constant([]))
    }
}
