//
//  SideMenu.swift
//  SwiftUITask
//
//  Created by Islam on 23/02/2022.
//

import SwiftUI

struct SideMenu: View {
     
     @Binding var currentTab: String
     
     //Adding Smooth Transition between tabs with the help of matched geometry effect ...
     @Namespace var animation
     
    var body: some View {
     
     VStack{
          HStack(spacing: 15.0){
               Image("img")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 65, height: 65)
                    .clipShape(Circle())
               Text("Islam Khalil")
                    .font(.title2.bold())
                    .foregroundColor(.white)
          }.padding()
          .frame(maxWidth: .infinity,  alignment: .leading)
          
         //For small screens...
          ScrollView(getRect().height < 750 ? .vertical : .init(), showsIndicators: false, content: {
               VStack(alignment: .leading, spacing: 25.0){
                    
                    //Tab Buttons ...
                    customTapButton(icon: "homekit", title: "Home")
                    
                    customTapButton(icon: "safari.fill", title: "Discover")
                    
                    customTapButton(icon: "applewatch", title: "Devices")
                    
                    customTapButton(icon: "person.fill", title: "Profile")
                    
                    customTapButton(icon: "gearshape.fill", title: "Settings")
                         
                    customTapButton(icon: "info.circle.fill", title: "About")
                    
                    customTapButton(icon: "questionmark.circle.fill", title: "Help")
                    
                    Spacer()
                    
                    customTapButton(icon: "square.and.arrow.up", title: "Logout")
                    
                    
               }.padding().padding(.top, 45)
               .frame(width: getRect().width / 2, alignment: .leading)
               .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,  alignment: .leading)
          })
     }.padding(.leading, 10)
     .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .top)
     .background(
          Image("BG2")
              .resizable()
              .edgesIgnoringSafeArea(.all)
              .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
      )
    }
     
     //Custom Button...
     @ViewBuilder
     func customTapButton(icon: String, title: String)-> some View{
          Button{
               if title == "Logout" {
                    print("Logout ... ")
               } else {
                    withAnimation{
                         currentTab = title
                    }
               }
          } label: {
               HStack(spacing: 15.0){
                    Image(systemName: icon)
                         .font(.title3)
                         .foregroundColor(currentTab == title ? Color(.purple) : (title == "Logout" ? Color(.orange) : .white)
                         )
                         .frame(width: currentTab == title ? 48 : nil, height: 48)
                         .background(
                              ZStack{
                                   if currentTab == title {
                                        Color.white.clipShape(Circle())
                                             .matchedGeometryEffect(id: "TAPCIRCLE", in: animation)
                                   }
                              }
                         )
                    
                    Text(title)
                         .font(.callout)
                         .fontWeight(.semibold)
                         .foregroundColor(title == "Logout" ? .orange : .white)
               }.padding(.trailing , 20)
               .background(
                    ZStack{
                         if currentTab == title {
                              Color(.purple)
                                   .clipShape(Capsule())
                                   .matchedGeometryEffect(id: "TAPCAPSULE", in: animation)
                         }
                    }
               )
          }
          .offset(x: currentTab == title ? 15.0 : 0.0)
     }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//Extending view to get Screen Bounds...

extension View{
     func getRect() -> CGRect {
          return UIScreen.main.bounds
     }
}
