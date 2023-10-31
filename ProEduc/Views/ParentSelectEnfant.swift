//
//  ParentSelectEnfant.swift
//  ProEduc
//
//  Created by Apprenant 76 on 31/10/2023.
//

import SwiftUI

struct ParentSelectEnfant: View {
    @State private var isChildDetailActive: Bool = false
    @State var selectedChild: String? = nil
    var placeholder = "Selectionner un enfant"
    var dropDownList = ["Lida", "Wassila", "Zachari", "Sofian"]
    var body: some View {
        VStack{
            ZStack{
                
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(Color(.blueParent))
                    .frame(width: 350, height: 120)
                    .padding(.all)
                
                Text("Mes enfants")
                    .foregroundColor(.white)
                    .font(.system(size: 36))
                    .fontWeight(.bold)
                
            }
           
            Menu {
                ForEach(dropDownList, id: \.self) { child in
                    Button(child) {
                        self.selectedChild = child
                        self.isChildDetailActive = true                        }
                }
            } label: {
                VStack(spacing: 20) {
                    HStack {
                        Text(selectedChild ?? placeholder)
                            .foregroundColor(selectedChild == nil ? .gray : .black)
                        Spacer()
                        Image(systemName: "chevron.down")
                            .foregroundColor(Color.orange)
                            .font(Font.system(size: 20, weight: .bold))
                    }
                    .padding(.horizontal)
                    Rectangle()
                        .fill(Color.orange)
                        .frame(height: 2)
                }
                .padding()
            }
        }
    }
}
#Preview {
    ParentSelectEnfant()
}
