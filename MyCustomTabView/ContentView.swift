//
//  ContentView.swift
//  MyCustomTabView
//
//  Created by 박힘찬 on 2022/03/12.
//

import SwiftUI

enum Item {
    case one, two, three
}

struct ContentView: View {
    @State var item : Item = .one // initialize one

    var body: some View {
        ZStack(alignment: .bottom) {
            ChangeView(item: self.item)
            
            Circle()
                .frame(width: 90, height: 90)
                .foregroundColor(Color.white)
                .offset(x: ChangeTabPosition(item: self.item), y: UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 20 : 0) // if safe area none (ex) iphone SE)
            
            VStack(spacing: 0) {
                HStack(alignment: .bottom, spacing: 0) {
                    Rectangle()
                        .frame(width: 0)

                    Button(action: { // .one
                        withAnimation() {
                            self.item = .one
                        }}) {
                        Image(systemName: "homekit")
                            .font(.title)
                            .offset(y: self.item == .one ? -5 : 0)
                            .frame(width: UIScreen.main.bounds.width / 3, height: 50)
                            .scaleEffect(self.item == .one ? 1.2 : 1.0)
                            .foregroundColor(self.item == .one ? ChangeIconColor(item: self.item) : Color.gray)
                    }
                    .background(Color.white)
                    
                    Button(action: { // .two
                        withAnimation() {
                            self.item = .two
                        }}) {
                        Image(systemName: "cart.badge.plus")
                            .font(.title)
                            .offset(y: self.item == .two ? -5 : 0)
                            .frame(width: UIScreen.main.bounds.width / 3, height: 50)
                            .scaleEffect(self.item == .two ? 1.2 : 1.0)
                            .foregroundColor(self.item == .two ? ChangeIconColor(item: self.item) : Color.gray)
                    }
                    .background(Color.white)
         
                    Button(action: { // .three
                        withAnimation() {
                            self.item = .three
                        }}) {
                        Image(systemName: "person.crop.circle.fill")
                            .font(.title)
                            .offset(y: self.item == .three ? -5 : 0)
                            .frame(width: UIScreen.main.bounds.width / 3, height: 50)
                            .scaleEffect(self.item == .three ? 1.2 : 1.0)
                            .foregroundColor(self.item == .three ? ChangeIconColor(item: self.item) : Color.gray)
                    }
                    .background(Color.white)
                }
                
                Rectangle() // cover safe area
                    .frame(height: UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 0: 20) // if safe area none (ex) iphone SE)
                    .foregroundColor(Color.white)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}
// MARK: Change View
func ChangeView(item: Item) -> MyView {
    switch item {
    case .one:
        return MyView(title: "첫 번째 뷰", bgColor: Color.orange)
    case .two:
        return MyView(title: "두 번째 뷰", bgColor: Color.red)
    case .three:
        return MyView(title: "세 번째 뷰", bgColor: Color.purple)
    default:
        return MyView(title: "첫 번째 뷰", bgColor: Color.gray)
    }
}
// MARK: Change Icon Color
func ChangeIconColor(item: Item) -> Color {
    switch item {
    case .one:
        return Color.orange
    case .two:
        return Color.red
    case .three:
        return Color.purple
    default:
        return Color.orange
    }
}
// MARK: Change Tab Position
func ChangeTabPosition(item: Item) -> CGFloat {
    switch item {
    case .one:
        return -(UIScreen.main.bounds.width / 3)
    case .two:
        return 0
    case .three:
        return UIScreen.main.bounds.width / 3
    default:
        return -(UIScreen.main.bounds.width / 3)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
