//
//  addPurpose.swift
//  Project
//
//  Created by Randy on 23/06/22.
//

 import SwiftUI

 struct AddPurpose: View {
    @EnvironmentObject var homeModel: ChooseMethodViewModel
    @State var currentMethodData = ViewMethodModel(title: "", timing: Date())

    // show picker
    @State var showDatePicker = false
    @State var currentTransferType = "public"

    var body: some View {
        if homeModel.addNewMethod {
            VStack(spacing: 20) {
                HStack {
                    Button {
                        withAnimation {
                            homeModel.addNewMethod.toggle()
                        }
                    }label: {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                    Spacer()
                    Image("Profile")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())

                }
                .overlay(
                    Text(R.string.localizable.yourtransferpurposePlaceholder())
                        .font(.system(size: 18))
                )

                VStack(alignment: .leading, spacing: 15) {
                    Text(R.string.localizable.enteringpurposePlaceholder())
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)

                    TextField(R.string.localizable.useraccount2Placeholder(), text: $currentMethodData.title)
                        .font(.system(size: 16).bold())

                    Divider()
                }
                .padding()
                VStack(alignment: .leading, spacing: 15) {
                    Text("set Transaction")
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                    HStack {
                        let time = currentMethodData.timing.formatted(date: .omitted, time: .shortened)

                        let date = currentMethodData.timing.formatted(date: .abbreviated, time: .omitted)

                        Text("\(time), \(date)")
                            .fontWeight(.black)

                        Spacer(minLength: 10)

                        // custom date

                        Button {
                            withAnimation {
                                showDatePicker.toggle()
                            }
                        } label: {
                            Image(systemName: "calendar")
                                .foregroundColor(.black)
                                .padding(6)
                                .background(.blue, in: Circle())
                        }

                    }

                    Divider()
                }
                .padding()

                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .background(Color.white)
                .overlay(CustomDatePicker(date: $currentMethodData.timing, showPicker: $showDatePicker) )
                .transition(.move(edge: .bottom))
            }
        }
    }

    // Button for transfertype
    struct TransferTabButton: View {
        var title: String
        @Binding var currentType: String

        var body: some View {

            Button {
                withAnimation {
                    currentType = title
                }
            } label: {
                Text(title)
                    .font(.footnote)
                    .foregroundColor( title != currentType ? .black : .white)
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity )
                    .background(
                        Capsule()
                            .fill(.black.opacity(title == currentType ? 1 : 0))
                    )
            }
        }
    }

    struct CustomDatePicker: View {
        @Binding var date: Date
        @Binding var showPicker: Bool

        var body: some View {
            ZStack {
                Rectangle()
                    .fill(.ultraThinMaterial)
                DatePicker(" ", selection: $date, displayedComponents: [.date, .hourAndMinute]).labelsHidden()

                // close button
                Button {
                    withAnimation {
                        showPicker.toggle()
                    }
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .padding()
                        .background(.gray, in: Circle())

                }
                .padding(10)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            }.navigationBarTitle(R.string.localizable.settimetransactionPlaceholder(), displayMode: .inline)
                .opacity(showPicker ? 1 : 0)
        }

    }

    // struct AddPurpose_Previews: PreviewProvider {
    //    static var previews: some View {
    //        MethodView()
    //        }
    //    }
 }
