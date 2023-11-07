//
//  CertificatMedical.swift
//  ProEduc
//
//  Created by apprenant45 on 07/11/2023.



import SwiftUI

struct CertificatMedical: View {
    var body: some View {
        VStack{
            Spacer()
            ZStack{
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 350.0, height: 120.0)
                    .foregroundColor(Color(red: 0.013, green: 0.78, blue: 0.778))
                    .padding(.top, 11.0)
                    .overlay(
                        Text("Certificat médical")
                            .font(.system(size: 30))
                            .bold()
                            .foregroundColor(.white)
                    )
            }
            GeometryReader { geometry in
                Image("CertificatMedical")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
    }
}

#Preview {
    CertificatMedical()
}
