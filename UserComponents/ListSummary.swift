//
//  ListSummary.swift
//  Project
//
//  Created by Randy on 30/06/22.
//

import SwiftUI

struct ListSummary: View {
    var title = ""
    var subTitle = ""
//    var title = ""
//    var subTitle = ""
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(subTitle)
        }
        .padding(.top, 10)
    }
}

struct ListSummary_Previews: PreviewProvider {
    static var previews: some View {
        ListSummary()
    }
}
