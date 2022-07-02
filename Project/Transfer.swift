//
//  Transfer.swift
//  Project
//
//  Created by Randy on 30/06/22.
//

import SwiftUI
import Lottie

struct Transfer: View {

    @State var chooseBank: String = ""
    @State var inputNumber: String = ""

    var body: some View {

        ZStack {
            Color.cyan.opacity(0.5)
            VStack(alignment: .leading) {
                VStack {
                    VStack(alignment: .leading) {
                        Text("Destination Bank")
                        HStack {
                            TextField("Choose method", text: $chooseBank)
                            Image(systemName: "chevron.right")
                        }
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.black)

                    }.padding()

                    VStack(alignment: .leading) {
                        Text("Input Amount")
                        HStack {
                            TextField("input amount", text: $inputNumber)
                        }
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.black)

                    }.padding()

                    VStack {
                        Button(action: {

                        },
                               label: { Text("Continue")
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width-80)
                        }).background(Color.cyan)
                            .cornerRadius(10)
                            .padding(.vertical, 10)
                            .padding(.top, 10)
                    }

                }
                .frame(width: .infinity, height: 300)
                .background(Color.white)
                .cornerRadius(10)
                .padding(.horizontal, 20)

//                VStack(alignment: .leading) {
//                    Text("Choose your history recipient")
//                        .fontWeight(.medium)
//                        .foregroundColor(.white)
//                        .padding([.bottom, .top], 10)
//
//                    HStack {
//                        Image(systemName: "person.circle")
//                            .frame(width: 55, height: 55)
//                            .background(.white)
//                            .clipShape(Circle())
//                        VStack(alignment: .leading) {
//                            Text("User")
//                                .foregroundColor(.white)
//                                .fontWeight(.bold)
//                            Text("Bank Bisnis")
//                                .foregroundColor(.white)
//                            Text("123-1234-43")
//                                .foregroundColor(.white)
//                        }
//                    }
//
//                }.padding(.horizontal, 20)
                Spacer()
            }.padding(.top, 30)
        }
    }
}

struct Transfer_Previews: PreviewProvider {
    static var previews: some View {
        Transfer()
    }
}
