//
//  GridView.swift
//  Meconnect Login
//
//  Created by Srijan on 02/08/21.
//

import SwiftUI

struct GridView: View {
    let data = ["meWatch","meListen","meRewards","CNA_new_logo","8World Logo","elements-logo"]
        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]

        var body: some View {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(data, id: \.self) { item in
                        Image(item)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                    }
                }
                .padding(.horizontal)
            }
          
        }
    }

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
