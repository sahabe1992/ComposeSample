//
//  DeviderList.swift
//  itodayetp (iOS)
//
//  Created by chanchal.kumari on 19/08/21.
//

import SwiftUI

struct DeviderList: View {
    var isDarkTheme : Bool = false
    var body: some View {
        Divider().background( isDarkTheme ? Color.darkDevider : .grayeaeaea)
    }
}

struct DeviderList_Previews: PreviewProvider {
    static var previews: some View {
        DeviderList()
    }
}
