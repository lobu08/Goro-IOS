//
//  ImageSliderViewModel.swift
//  Goro
//
//  Created by EG LONGBUI on 2024/07/30.
//

import Foundation
import SwiftUI

class ImageSliderViewModel<T: Identifiable>: ObservableObject {
    @Published var data: [T]
    @Published var activeID: UUID?
    
    
    var showsIndicator: ScrollIndicatorVisibility = .hidden
    var showPagingControl: Bool = true
    var pagingControlSpacing: CGFloat = 5
    var spacing: CGFloat = 10
    var tittleScrollSpeed: CGFloat = 1.0
    var sliderID: Int = 0
    
    init(sliderID: Int, data: [T]) {
        self.sliderID = sliderID
        self.data = data
    }
    
    
    
    var activePage: Int {
        if let index = data.firstIndex(where: { $0.id as? UUID == activeID }) as? Int {
            return index
        }
        return 0
    }
    
    func scrollOffset(_ proxy: GeometryProxy) -> CGFloat {
        let minX = proxy.bounds(of: .scrollView)?.minX ?? 0
        return -minX * min(tittleScrollSpeed, 1.0)
    }
    
    func setCountOfImage(sliderID: Int) -> (Int, Int) {
        switch sliderID {
        case 0:
            return (1,1)
        case 1:
            return (8,2)
        case 2:
            return (2,1)
        default:
            return (0,0)
        }
        
    }
}
