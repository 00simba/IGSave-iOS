//
//  ContentView.swift
//  IGSave
//
//  Created by Sameer Qureshi on 2023-05-15.
//

import SwiftUI
import Foundation

class PostObject: Identifiable {
    
    var id = UUID()
    var url: String
    var base64: String
    
    init(url: String, base64: String){
        self.url = url
        self.base64 = base64
    }
}

class CollectionObject: Identifiable {
    var id = UUID()
    var name: String
    let thumbnail = "photo.on.rectangle.angled"
    var posts: Array<PostObject> = Array()
    
    init(name: String) {
        self.name = name
    }
}

@MainActor class Collections : ObservableObject {
    @Published var collections = Array<CollectionObject>()
}

struct ContentView: View {
    
    
    @Environment(\.colorScheme) var colorScheme
    
    @StateObject var viewModel = ViewModel()
    @StateObject public var collection = Collections()
    
    @State var url = ""
    
    @State var tappedHome = true
    @State var tappedFavorite = false
    @State var tappedInfo = false
    @State var tappedMore = false
    
    
    var body: some View {
        NavigationStack{
                ZStack(alignment: .top){
                        if tappedHome{
                            VStack(){
                                Header()
                                DownloadSection()
                                InfoSection()
                                StepsSection()
                                Spacer()
                                MenuBar(tappedHome: $tappedHome, tappedFavorite: $tappedFavorite, tappedInfo: $tappedInfo, tappedMore: $tappedMore)
                            }
                        }
                        if tappedFavorite{
                            VStack(){
                                FavoriteView()
                                Spacer()
                                MenuBar(tappedHome: $tappedHome, tappedFavorite: $tappedFavorite, tappedInfo: $tappedInfo, tappedMore: $tappedMore)
                            }
                        }
                        if tappedInfo{
                            VStack(){
                                InfoView()
                                Spacer()
                                MenuBar(tappedHome: $tappedHome, tappedFavorite: $tappedFavorite, tappedInfo: $tappedInfo, tappedMore: $tappedMore)
                            }
                        }
                        if tappedMore{
                            VStack(){
                                MoreView()
                                Spacer()
                                MenuBar(tappedHome: $tappedHome, tappedFavorite: $tappedFavorite, tappedInfo: $tappedInfo, tappedMore: $tappedMore)
                            }
                        }
                }.background(colorScheme == .light ? LinearGradient(colors: [.purple, .white], startPoint: .bottom, endPoint: .top) : LinearGradient(colors: [.purple, .black], startPoint: .bottom, endPoint: .top))
            
            }.environmentObject(collection)
    }

        
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }    
}
