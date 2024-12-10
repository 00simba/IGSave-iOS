//
//  SelectView.swift
//  IGSave
//
//  Created by Sameer Qureshi on 2023-08-15.
//

import SwiftUI

struct SelectView: View {
    
    @ObservedObject var viewModel : ViewModel
    @Binding var tappedAdd: Bool
    @Binding var url: String
    @State var multiSelection = Set<UUID>()
    @EnvironmentObject var collection : Collections
    
    struct Ocean: Identifiable, Hashable {
        let name: String
        let id = UUID()
    }

    public var oceans = [
        Ocean(name: "Pacific"),
        Ocean(name: "Atlantic"),
        Ocean(name: "Indian"),
        Ocean(name: "Southern"),
        Ocean(name: "Arctic")
    ]
    
    @State var uuidArray = Array<String>()
    
    func updateCollection(multiSelection: String){
        
        let uuidArray = multiSelection.description.trimmingCharacters(in: CharacterSet(charactersIn: "[]"))
            .components(separatedBy:",")
        

        for uuid in uuidArray{
            for col in self.collection.collections{
                if uuid == col.id.uuidString {
                    col.posts.append(PostObject(url: url, base64: viewModel.Posts[0].base64))
                }
            }
        }
        
    }
    
    var body: some View {
        NavigationView {
            VStack{
                List(self.collection.collections, selection: $multiSelection) {collection in
                    Text(collection.name)
                }.onTapGesture {
                    updateCollection(multiSelection: multiSelection.description)
                }
            }.navigationTitle("Favorites").toolbar {
                EditButton()}
        }
    }
}

struct SelectView_Previews: PreviewProvider {
    static var previews: some View {
        SelectView(viewModel: ViewModel(), tappedAdd: .constant(true), url: .constant("")).environmentObject(Collections())
    }
}
