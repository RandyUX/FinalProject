//
//  chooseMethodCardView.swift
//  Project
//
//  Created by Randy on 23/06/22.
//

 import SwiftUI
 import FirebaseAnalytics

 struct ChooseMethodCardView: View {
    @Binding var chooseForMethod: ViewMethodModel
    var body: some View {
        VStack(spacing: 20) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 12) {
                    Text(chooseForMethod.timing.formatted(date: .numeric, time: .omitted))
                        .font(.caption)
                    Text(chooseForMethod.title)
                        .font(.title2.bold())
                    Text("\(chooseForMethod.members.count)")
                        .font(.caption)
                }
                Spacer(minLength: 0)
                // Custom Toggle
                ZStack(alignment: chooseForMethod.turnedOn ? .trailing : .leading) {
                    Capsule()
                        .fill(.secondary)
                        .foregroundColor(.white)
                        .frame(width: 35, height: 18)

                    Circle()
                        .fill(.white)
                        .frame(width: 18, height: 18)

                }
                .shadow(radius: 1.5)
                .onTapGesture {
                    // changing on Tap...
                    chooseForMethod.turnedOn.toggle()
                }

            }
            HStack(spacing: 0) {
                ForEach(1...3, id: \.self) {index in
                    Image("asdfaasf\(index)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 25)
                        .padding(4)
                        .background(.white, in: Circle())
                    // border...
                        .background(
                            Circle()
                                .stroke(.black, lineWidth: 1)
                        )
                }

                Spacer(minLength: 15)

                Button {

                }label: {
                    Text(R.string.localizable.choosemethodPlaceholder())
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                }
                .buttonStyle(.bordered)
                .controlSize(.small)
                .shadow(radius: 1.2)

            }
            .padding(.top, 20)
        }
        .padding()
        .background(chooseForMethod.cardColor, in: RoundedRectangle(cornerRadius: 10))
    }

    // fun

 }
//
// struct ChooseMethodCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        MethodView()
//    }
// }
