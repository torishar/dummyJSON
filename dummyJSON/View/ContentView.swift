//
//  ContentView.swift
//  dummyJSON
//
//  Created by Viktoriia Sharukhina on 19.02.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    
    let servise = Service()
    @State var users = [Users]()
    
    var body: some View {
        ScrollView{
            VStack(spacing: 20) {
                ForEach(users, id: \.self) {
                    users in
                    UserView(users: users)
                }
            }
            .padding()
        }
        .onAppear{
            servise.sendRequest { (result) in
                switch result {

                case .success(let user):
                    self.users = user.users
                case .failure(let error):
                    print("error: ", error)
                }
            }
        }
    }
}

struct UserView: View {

    let users: Users
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color("backgroudColor"))
                .cornerRadius(10)
            VStack (alignment: .leading) {
                if let image = users.image {
                    WebImage(url: URL(string: image))
                        .resizable()
                        .frame(height: 180)
                        .cornerRadius(10)
                }
                HStack {
                    Text(users.firstName ?? "")
                    Text(users.lastName ?? "")
                }
                .font(.system(size: 16, weight: .bold))
                Text("phone: \(users.phone ?? "")")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.gray)
                Text("age: \(users.age ?? 0)")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.gray)
            }
            .padding(20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


