//
//  CustomTabView.swift
//  SwiftUITask
//
//  Created by Islam on 23/02/2022.
//

import SwiftUI

struct CustomTabView: View {
     
     @Binding var showMenu: Bool
     
     @Binding var currnetTab : String
     
  
     
    var body: some View {
     VStack{
          HStack{
               //Menu Button...
               Button{
                    withAnimation(.spring()){
                         showMenu = !showMenu
                    }
                    
               } label: {
                    Image(systemName: "line.horizontal.3.decrease")
                         .font(.title)
                         .foregroundColor(.white)
               }
               Spacer()
               
               Button{
                    
               } label: {
                    Image("img")
                         .resizable()
                         .aspectRatio(contentMode: .fill)
                         .frame(width: 40, height: 40)
                         .cornerRadius(5.0)
               }
          }.overlay(
               Text(currnetTab)
                    .font(.title2.bold())
                    .foregroundColor(.white)
                    .opacity(showMenu ? 0 : 1)
                    .padding(.top)
          )
          .padding([.horizontal,.top])
          .padding(.bottom,8)
          .padding(.top,getSafeArea().top)
          
          
          TabView(selection: $currnetTab){
               Home().tag("Home")
               Text("Discover").tag("Discover")
               Text("Devices").tag("Devices")
               Text("Profile").tag("Profile")
               Text("Settings").tag("Settings")
                  }
     }
     .frame(maxWidth: .infinity, maxHeight: .infinity)
     .background(
          Color(.black)
     )
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
