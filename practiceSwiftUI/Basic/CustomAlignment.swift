//
//  CustomAlignment.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 1/19/24.
//

import SwiftUI

struct CustomAlignment: View {
    var body: some View {
        HStack(alignment: .oneThird) {
            Rectangle()
                .foregroundColor(Color.green)
                .frame(width: 50, height: 200)
            Rectangle()
                .foregroundColor(Color.red)
                .alignmentGuide(.oneThird, computeValue: { d in
                    d[VerticalAlignment.bottom]
                })
                .frame(width: 50, height: 200)
            Rectangle()
                .foregroundColor(Color.blue)
                .frame(width: 50, height: 200)
            Rectangle()
                .foregroundColor(Color.orange)
                .alignmentGuide(.oneThird, computeValue: { d in
                    d[VerticalAlignment.top]
                })
                .frame(width: 50, height: 200)
        }//HStack
    }//View
}

#Preview {
    CustomAlignment()
}

extension VerticalAlignment {
    private enum OneThird : AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return context.height / 3
        }
    }
    static let oneThird = VerticalAlignment(OneThird.self)
}
