//
//  ContentView.swift
//  Shared
//
//  Created by Bob Bulliard on 11/14/21.
//

import SwiftUI
import Foundation
import Combine

struct User:  Hashable,Codable, Identifiable
{
    var id: Int
    var name: String
    var addr: String
    var city: String
    var state: String
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
      }
enum CodingKeys: String, CodingKey
{
    case name
    case addr
    case city
    case state
    case imageName
}

//var users: (User)
struct ContentView: View
{
    var body: some View{
    /*
     begin nav link
     */
             NavigationView{
                 List{
                     NavigationLink("List Json", destination: nextview())
                        .padding()
                     NavigationLink("choos world2", destination: nextview2())
                         .padding()
                     NavigationLink("choos world3", destination: nextview3(users: (users)))
                         .padding()
                 }
             }}
     // end nav link}
    struct nextview: View
 {
        var body: some View{
        List(users)
      {user in
            VStack(alignment: .leading)
                {
                Text(user.name)
                        .font(.system(size: 10))
                    Spacer()
                    Text(user.addr)
                        .font(.system(size: 10))
                    Spacer()
                    Text(user.city)
                        .font(.system(size: 10))
                    Spacer()
                    Text(user.state)
                        .font(.system(size: 10))
                    Spacer()
                    Spacer()
                    VStack(alignment: .leading){
                        user.image
                            .resizable()
                            .frame(width: 250, height: 250)
                        Text("-------------------------")
                            .bold()
                            .font(.system(size: 16))
                    }
                    
                        }
          
                }
            
        }
  }
}
struct nextview2: View {
    var body: some View {
     
        Text("Hello, world2!")
        
            .font(.callout)
            .fontWeight(.bold)
            .padding(60.0)
           
            .background(.green)
            
    }
}

struct nextview3: View {
   // var users : User
    var users:[User]
    var body: some View {
        
        Text("Hello, world3!")
       
        
            .font(.callout)
            .fontWeight(.bold)
            .padding(60.0)
            .background(.yellow)
       
    }
}
