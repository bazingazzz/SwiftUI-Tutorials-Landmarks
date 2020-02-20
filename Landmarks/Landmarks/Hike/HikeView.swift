/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view displaying information about a hike, including an elevation graph.
*/

import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        let insertion = AnyTransition.move(edge: .leading)
            .combined(with: .opacity)
        let removal = AnyTransition.move(edge:.trailing)
        .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

struct HikeView: View {
    //数据
    var hike: Hike
    
    //静态全局变量：是否展示细节
    @State private var showDetail = true
    
    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)
                
                VStack(alignment: .leading) {
                    Text(verbatim: hike.name)
                        .font(.headline)
                    Text(verbatim: hike.distanceText)
                }
                
                Spacer()

//                Button(action: {
//                    withAnimation(.easeInOut) {
//                        self.showDetail.toggle()
//                    }
//                }) {
//                    Image(systemName: "chevron.right.circle")
//                        .imageScale(.large)
//                        .rotationEffect(.degrees(showDetail ? 90 : 0))
//                        .scaleEffect(showDetail ? 1.5 : 1)
//                        .padding()
//                }
            }

//            if showDetail {
                HikeDetail(hike: hike)
                    .transition(.moveAndFade)
//            }
        }
    }
}

struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        HStack(alignment: .bottom) {
            HikeView(hike: hikeData[0])
                .padding()
        }
    }
}
