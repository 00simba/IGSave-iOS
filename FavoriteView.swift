//
//  FavoriteView.swift
//  IGSave
//
//  Created by Sameer Qureshi on 2023-06-07.
//

import SwiftUI

struct FavoriteView: View {
    
    @EnvironmentObject var collection : Collections
    
    @State private var presentAlert = false
    @State private var name = ""
    @State public var collectionPosts = Array<PostObject>()
    @State var tappedCollection = false
    
    let items = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    func addCollection() {
        if(name != ""){
            self.collection.collections.append(CollectionObject(name: name))
        }
        name = ""
    }
        
    var body: some View {
        ZStack{
            VStack{
                Text("Favourites").font(.system(size: 32, weight:.bold)).frame(maxWidth: .infinity, alignment: .leading).padding()
                VStack(){
                    HStack{
                        Image(systemName: "plus").font(.system(size: 40))
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                            .padding(20)
                            .background(Color.purple)
                            .clipShape(Rectangle()).cornerRadius(10).onTapGesture {
                                presentAlert = true
                            }
                    }.padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30)).alert("Create New Collection", isPresented: $presentAlert, actions: {
                        TextField("", text: $name)
                        Button("Submit", action: addCollection)
                        Button("Cancel", role: .cancel){
                            name = ""
                        }
                    }, message: {
                        TextField("TextField", text: .constant("Enter a collection name."))
                    })
                    
                }.frame(maxWidth: .infinity, alignment: .leading).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 30))
                    
                ScrollView(.vertical){
                    LazyVGrid(columns: items) {
ForEach(self.collection.collections){ collection in

    
                            VStack{
                                (collection.posts.isEmpty ?
                                 
                                Image(systemName: collection.thumbnail).font(.system(size: 50))
                                    .frame(width: 90, height: 90).border(.gray).cornerRadius(10.0).overlay(
                                        RoundedRectangle(cornerRadius: 10.0).stroke(Color(.gray), lineWidth: 2)) :
                                
                                Image(uiImage: UIImage(data: Data(base64Encoded: collection.posts[0].base64.replacingOccurrences(of: "data:image/jpeg;base64,", with: "")) ?? Data())!).resizable().font(.system(size: 50))
                                    .frame(width: 90, height: 90).border(.gray).cornerRadius(10.0).overlay(
                                        RoundedRectangle(cornerRadius: 10.0).stroke(Color(.gray), lineWidth: 2))
                                 
                                )
                                Text(collection.name)
                            }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5)).onTapGesture {
                                    self.collectionPosts = collection.posts
                                    self.tappedCollection.toggle()
                            }
                        }
                    }.padding()
                }
                Spacer()
            }
        }.navigationDestination(isPresented: $tappedCollection) {
            CollectionView(tappedCollection: self.$tappedCollection, collectionPosts: self.$collectionPosts)
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView().environmentObject(Collections())
    }
}
