//
//  view.swift
//  Project
//
//  Created by Randy on 22/06/22.
//

 import SwiftUI
 import FirebaseAnalytics

 enum NextSummary: String {
    case confirmSummary = "ConfirmSummary"
 }

 struct MethodView: View {
    @Binding var sourceNavigation: String?
    @State private var navigationSummary: String?
    @State var form: Users?

    func tapButtonSummary() {
        navigationSummary = NextSummary.confirmSummary.rawValue
    }

    private func renderToSummary() -> some View {
        Button(action: tapButtonSummary) {Text(R.string.localizable.continuePlaceholder())
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(100)
                .foregroundColor(.white)
                .font(.headline)
            .padding(.top, 50)}
    }

    private func renderNavigationSummary() -> some View {
        NavigationLink(destination: SummaryBeforeTransaction(sourceNavigation: $navigationSummary, getInfo: $form), tag: NextSummary.confirmSummary.rawValue,
                       selection: $navigationSummary) {EmptyView()}
    }

    var body: some View {
        HomeChooseMethod()
        renderNavigationSummary()
        renderToSummary()
            .padding()

    }
 }

// struct View_Previews: PreviewProvider {
//    static var previews: some View {
//        MethodView()
//    }
// }
