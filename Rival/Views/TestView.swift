//
//  TestView.swift
//  Rival
//
//  Created by Desi Rorie on 8/7/23.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        ZStack {
            Color("MainColor")
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
