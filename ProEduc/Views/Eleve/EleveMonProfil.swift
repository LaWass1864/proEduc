
//  ProfilsView.swift
//  ProEduc
//
//  Created by elamine heuss on 19/10/2023.
//

//
//  ContentView.swift
//  GiveGood
//
//  Created by Louise Ta on 21/09/2023.
//


import SwiftUI
import Foundation

struct EleveMonProfil: View {
    @State private var isDarkModeEnabled: Bool = false
    @State private var notificationEnabled: Bool = false
    
    // Switch the app language
    @State private var languageIndex = 0
    var languageOptions = ["Français", "English"]

    
    var body: some View {
        NavigationView {
            Form {
                ZStack {
                    HStack{
                        Spacer()
                        VStack {
                            
                            // user informations
                            
                            Image("oeoeoe")
                                .resizable()
                                .frame(width:100, height: 100, alignment: .center)
                            Text("Jonatan diakaté")
                                .font(.title)
                            Text("jonnhatan@gmail.com")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Spacer()
                            
                            // Edit the profil button
                            
                            Button(action: {
                                print("Edit Profile tapped")
                            })
                            {
                                Text("Editer le profil")
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .font(.system(size: 18))
                                    .padding()
                                    .foregroundColor(.white)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 25)
                                            .stroke(Color.white, lineWidth: 2)
                                    )
                            }
                            .background(Color.blue)
                            .cornerRadius(25)
                        }
                        Spacer()
                    }
                }
                
                // Personal information section
             
                    HStack{
                        NavigationLink(destination: EleveListDoc()){
                            Image(systemName: "bookmark")
                            Text("INFORMATIONS PERSONNELLES")
                        }
                    }
                    HStack{
                        NavigationLink(destination: EleveListDoc()){
                            Image(systemName: "bookmark")
                            Text("Mot de passe et sécurité")
                        }
                    }
                    
                HStack{
                    NavigationLink(destination: EleveBesoinAide()) {
                        Image(systemName: "book")
                        Text("Besoin d’aide")
                    }
                }
                
                Section(header: Text("PREFERENCES"), content: {
                    HStack{
                        Image(systemName: "globe")
                        Picker(selection: $languageIndex, label: Text("Language")) {
                            ForEach(0 ..< languageOptions.count) {
                                Text(self.languageOptions[$0])
                            }
                        }
                    }
                    HStack{
                        Image(systemName: "moon")
                        Toggle(isOn: $isDarkModeEnabled) {
                            Text("Mode Sombre")
                        }
                    }
                    HStack{
                        Image(systemName: "bell")
                        Toggle(isOn: $notificationEnabled){
                            Text("Notifications")
                        }
                    }
                })
                
                Button("Button title") {
                    print("Button tapped!")
                }
            }
            .navigationBarTitle("Profils")
        }
        
    }
}

#Preview {
   EleveMonProfil()
}