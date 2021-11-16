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
    
      }
enum CodingKeys: String, CodingKey
{
    case name
    case addr
    case city
    case state
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
                      //   .padding() .padding()
                     NavigationLink("choos world3", destination: nextview2())
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
                    Text(user.addr)
                    Text(user.city)
                    Text(user.state)
                        
                }
            
        }
  }
}
struct nextview2: View {
    var body: some View {
     
        Text("Hello, world3!")
            .font(.callout)
            .fontWeight(.bold)
            .padding(60.0)
           
            .background(.green)
            
    }
}
}
