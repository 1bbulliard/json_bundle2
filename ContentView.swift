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
                     NavigationLink("list only name", destination: nextview2())
                         .padding()
                     NavigationLink("choos world3", destination: nextview3(users: (users)))
                         .padding()
                     NavigationLink("choose Tinas world4", destination: nextview4())
                     Image("tina")
                         .renderingMode(.original)
                         .resizable()
                         .frame(width: 100, height: 100)
                         .padding()
                     NavigationLink("App storage- remembers whats typed", destination: nextview5())
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
 //   @State private var usersx: User = users()
    var body: some View {
     
        Text("list only name!")
        
            .font(.callout)
            .fontWeight(.bold)
            .padding(60.0)
           .background(.green)
        
        
        List{
            ForEach(users) {user in
                    Text(user.name)
            }
            // begin delete
            .onDelete { indexSet in
            for index in indexSet {
                    users.remove(at: index)}}
            // end delete
            
            .onMove (perform: move)
            // begin move
            // end move
         //   .navigationBarItems(trailing: EditButton())
        }}}
func move(from source: IndexSet, to destination : Int) {
    
    users.move(fromOffsets: source, toOffset: destination)
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
struct ResultView: View {
    var choice: String

    var body: some View {
        Text("You chose \(choice)")
    }
}
struct nextview4: View {
   
    var body: some View {
        
        Text("Tina's flip of the coin!")
            .font(.callout)
            .fontWeight(.bold)
            .padding(60.0)
            .background(.yellow)
        
        NavigationView {
                    VStack(spacing: 30) {
                        Text("You're going to flip a coin – do you want to choose heads or tails?")

                        NavigationLink(destination: ResultView(choice: "Heads")) {
                            Text("Choose Heads")
                        }

                        NavigationLink(destination: ResultView(choice: "Tails")) {
                            Text("Choose Tails")
                        }
                    }
                    .navigationTitle("Navigation")
                }
       
    }
}
struct nextview5: View {
    
    @AppStorage("firstname") var firstname = ""
    @AppStorage("lastname") var lastname = ""
    @AppStorage("issubscribed") var issubscribed = false
    
    var body: some View {
        VStack{
            Form{
                Section(header: Text("Details")) {
                TextField("First Name", text: $firstname)
                TextField("Last Name", text: $lastname)
                    Toggle("is subscribed",isOn: $issubscribed)
        }
                
            }
        .navigationTitle("AppStorage- remembers whats typed")
}
}
}
