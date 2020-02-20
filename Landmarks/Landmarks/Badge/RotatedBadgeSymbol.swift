//
//  RotatedBadgeSymbol.swift
//  Landmarks
//
//  Created by 郑嘉浚 on 2020/1/13.
//  Copyright © 2020 郑嘉浚. All rights reserved.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    let angle: Angle
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

struct RotatedBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbol(angle: .init(degrees: 10))
    }
}
