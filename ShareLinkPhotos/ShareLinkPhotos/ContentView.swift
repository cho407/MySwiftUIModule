//
//  ContentView.swift
//  ShareLinkPhotos
//
//  Created by 조형구 on 2022/11/16.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    ShareLinkView()
                } label: {
                    Label("ShareLink Demo", systemImage: "square.and.arrow.up")
                }
                
                NavigationLink {
                    PhotosUIView()
                } label: {
                    Label("PhotosUI Demo", systemImage: "photo")
                }
            }
            .navigationTitle("SwiftUI 4.0")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
