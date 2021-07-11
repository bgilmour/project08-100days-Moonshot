//
//  ContentView.swift
//  Moonshot
//
//  Created by Bruce Gilmour on 2021-07-11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
//        ScrollView(.vertical) {
//            VStack(spacing: 10) {
                ForEach(0 ..< 100) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
//            }
//            .frame(maxWidth: .infinity)
//        }
        }
    }
}

struct CustomText: View {
    var text: String

    init(_ text: String) {
        print("Creating a new CustomText(\(text)")
        self.text = text
    }

    var body: some View {
        Text(text)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
