//
//  homeChooseMethod.swift
//  Project
//
//  Created by Randy on 22/06/22.
//

 import SwiftUI
 import FirebaseAnalytics

 struct HomeChooseMethod: View {
    @Namespace var animationID
    @State var currentTab = "Upcoming"

    @StateObject var homeChooseMethodModel = ChooseMethodViewModel()

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                Text(R.string.localizable.useraccountPlaceholder())
                    .font(.title3)
                // letter spacing..
                    .kerning(1.1)
                    .frame(maxWidth: .infinity, alignment: .leading)

                HStack(alignment: .bottom) {
                    Text(R.string.localizable.titleinmethodPlaceholder())
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 8)

                    Button {
                        withAnimation {
                            homeChooseMethodModel.addNewMethod.toggle()
                        }
                    }label: {
                        Text(R.string.localizable.settimetransactionPlaceholder())
                            .font(.caption)
                            .foregroundColor(.black)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .background(
                                Capsule()
                                    .stroke(.black, lineWidth: 1))
                    }
                }
                // Custom segment tab View...

                .padding(.top, 25)

                VStack(spacing: 15) {
                    // in IOS 15 we can directly pass Binding
                    ForEach($homeChooseMethodModel.chooseMethod) {$choosemethod in

                        // choose method card view..
                        ChooseMethodCardView(chooseForMethod: $choosemethod)

                    }
                }.padding(.top, 20)
            }
            .padding()
        }.navigationBarTitle(R.string.localizable.choosemethodPlaceholder(), displayMode: .inline)
            .background(Color("Bg"))
            .overlay(AddPurpose().environmentObject(homeChooseMethodModel))
    }
 }
 struct HomeChooseMethod_Previews: PreviewProvider {
    static var previews: some View {
        HomeChooseMethod()
    }
 }

 struct TapButton: View {
    @Binding var currentTab: String
    var title: String
    // for bottom indicator slide animation...
    var animationID: Namespace.ID

    var body: some View {
        Button {
            withAnimation(.spring()) {
                currentTab = title
            }
        } label: {

            VStack {
                Text(title).fontWeight(.semibold)
                    .foregroundColor(currentTab == title ? .black : .gray)

                if currentTab == title {
                    Rectangle()
                        .fill(.black)
                        .matchedGeometryEffect(id: "TAB", in: animationID)
                        .frame(width: 50, height: 1)
                } else {
                    Rectangle()
                        .fill(.black)
                        .frame(width: 50, height: 1)
                }
            }
            // Taking Available width
            .frame(maxWidth: .infinity)
        }
    }
 }
