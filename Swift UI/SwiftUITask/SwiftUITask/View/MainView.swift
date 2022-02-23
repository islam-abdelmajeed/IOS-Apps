//
//  MainView.swift
//  SwiftUITask
//
//  Created by Islam on 23/02/2022.
//

import SwiftUI

struct MainView: View {
     //current Tab
     @State var currentTab: String = "Home"
     
     @State var showMenu: Bool = false
     
     //Hidding native tab bar...
     init() {
          UITabBar.appearance().isHidden = true
     }
     
    var body: some View {
     
     ZStack{
          //Custom side menu...
          SideMenu(currentTab: $currentTab)
               
          
          //Main tab view...
          CustomTabView(showMenu: $showMenu, currnetTab: $currentTab)
               .cornerRadius(showMenu ? 25 : 0)
               .rotation3DEffect(
                    .init(degrees: showMenu ? -15 : 0),
                    axis: (0 , 1 ,0),
                    anchor: .trailing
               )
               .offset(x: showMenu ? getRect().width / 2 : 0)
               .ignoresSafeArea()
     }
     .preferredColorScheme(.dark)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

extension View {
     func getSafeArea() -> UIEdgeInsets {
          guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
               return.zero
          }
          guard let safeArea = screen.windows.first?.safeAreaInsets else {
               return.zero
          }
          return safeArea
     }
}
