//
//  PinTransaction.swift
//  Project
//
//  Created by Randy on 22/06/22.
//

import SwiftUI
import FirebaseCrashlytics
import FirebaseAnalytics
struct PinTransaction: View {
    @State var status = false

    @Binding var sourceNavigation: String?
    @Binding var getInfo: DataForm?

    var body: some View {

        VStack {
            if status {
                SummaryAfterTransaction(sourceNavigation: $sourceNavigation, getInfo: $getInfo)
            } else {
                Verification(status: $status)
            }

        }.onAppear {

            // onLoad()
        }

        .preferredColorScheme(self.status ? .light : .light)
        .animation(.spring())

    }
}

struct Verification: View {
    @State var code: [String] = []
    @Binding var status: Bool
    var body: some View {
        VStack {
            Spacer()
            Text("Enter Your Pin").font(.title)
            HStack {

                ForEach(code, id: \.self) {index in
                    Text(index).font(.title).fontWeight(.semibold)
                }

            }.padding(.vertical)
            Spacer()
            NumberPad(codes: $code, status: $status)
        }
    }
}

struct NumberPad: View {
    @Binding var codes: [String]
    @Binding var status: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(datas) { index in
                HStack(spacing: self.getspacing()) {
                    ForEach(index.row) {jindex in
                        Button(action: {
                            if jindex.value == "delete.left.fill"{
                                self.codes.removeLast()
                            } else {
                                self.codes.append(jindex.value)
                                if self.codes.count == 6 {
                                    if getCode() == InsertPin.authenticatePin.getPin() {

                                        print(self.getCode())

                                        status.toggle()
                                        print("success")
                                    } else {
                                        print("false")
                                        print(self.getCode())
                                        print(InsertPin.authenticatePin.getPin())
                                    }
                                    print(self.getCode())
                                    NotificationCenter.default.post(name: NSNotification.Name("Success"), object: nil)
                                    self.codes.removeAll()
                                    print(getCode())

                                }
                            }
                        }) {
                            if jindex.value == "delete.left.fill" {
                                Image(systemName: jindex.value).font(.body).padding(.vertical)
                            } else {
                                Text(jindex.value).font(.body).fontWeight(.semibold).padding(.vertical)
                            }

                        }
                    }
                }
            }
        }.foregroundColor(.black)
            .navigationBarTitle("Insert Your Pin", displayMode: .inline)
    }

    func getspacing() -> CGFloat {
        return UIScreen.main.bounds.width / 3
    }

    func getCode() -> String {
        var code = ""
        for index in self.codes {

            code += index
        }
        return code
    }
}

// data..

struct TypeR: Identifiable {
    var id: Int
    var row: [Row]
}

struct Row: Identifiable {
    var id: Int
    var value: String
}

var datas = [
    TypeR(id: 0, row: [Row(id: 0, value: "1"), Row(id: 1, value: "2"), Row(id: 2, value: "3")]),
    TypeR(id: 1, row: [Row(id: 0, value: "4"), Row(id: 1, value: "5"), Row(id: 2, value: "6")]),
    TypeR(id: 2, row: [Row(id: 0, value: "7"), Row(id: 1, value: "8"), Row(id: 2, value: "9")]),
    TypeR(id: 3, row: [Row(id: 0, value: "delete.left.fill"), Row(id: 1, value: "0")])
]
