//
//  ImageSliderView.swift
//  Goro
//
//  Created by EG LONGBUI on 2024/07/30.
//

import SwiftUI

struct ImageSliderView<T: Identifiable, Content: View>: View {
    
    @ObservedObject var ImageSliderVM: ImageSliderViewModel<T>
    @ViewBuilder var content: (T) -> Content
    
    var body: some View {
        let (count, span) = ImageSliderVM.setCountOfImage(sliderID: ImageSliderVM.sliderID)
        VStack(spacing: ImageSliderVM.pagingControlSpacing) {
            ScrollView(.horizontal) {
                HStack(spacing: ImageSliderVM.spacing) {
                    ForEach(ImageSliderVM.data) { item in
                        VStack(spacing: 0) {
                            content(item)
                        }
                        .containerRelativeFrame(.horizontal, count: count, span: span, spacing: 10.0)
                    }
                }
                .scrollTargetLayout()
            }
            .scrollIndicators(ImageSliderVM.showsIndicator)
            .scrollTargetBehavior(.viewAligned)
            .scrollPosition(id: $ImageSliderVM.activeID)
            if ImageSliderVM.showPagingControl {
                            PagingControl(numberOfPages: ImageSliderVM.data.count, activePage: ImageSliderVM.activePage) { value in
                                if let index = value as? Int, ImageSliderVM.data.indices.contains(index) {
                                    let id = ImageSliderVM.data[index].id
                                    withAnimation(.snappy(duration: 0.35, extraBounce: 0)) {
                                        ImageSliderVM.activeID = id as! UUID
                                    }
                                }
                            }
                        }
            
        }
    }
}

#Preview {
    ContentView()
}
