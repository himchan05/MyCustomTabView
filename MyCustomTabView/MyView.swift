//
//  MyView.swift
//  MyCustomTabView
//
//  Created by 박힘찬 on 2022/03/12.
//

import SwiftUI

struct MyView: View {
    var title: String
    var bgColor: Color
    
    var body: some View {
        Rectangle()
            .foregroundColor(bgColor)
            //.edgesIgnoringSafeArea(.top)
            .overlay(Text(title)
                        .font(.system(size: 50, weight: .bold, design: .rounded)))
            //.offset(y: 0)
    }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView(title: "#번", bgColor: Color.cyan)
    }
}
