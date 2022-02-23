//
//  Home.swift
//  SwiftUITask
//
//  Created by Islam on 23/02/2022.
//

import SwiftUI

struct Home: View {
    var body: some View {
     ScrollView(.vertical, showsIndicators: false){
          VStack{
               Image("img")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: getRect().width - 30, height: 250)
                    .cornerRadius(18.0)
               
               Text("ISLAM KHALIL")
                    .font(.title2.bold())
               
               Text("IOS Developer")
                    .font(.callout.bold())
                    .foregroundColor(.gray)
          }.padding()
     }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
