//
//  PagingControllerVC.swift
//  Goro
//
//  Created by EG LONGBUI on 2024/08/01.
//

import Foundation
import SwiftUI

struct PagingControl: UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        return Coordinator(onPageChange: onPageChange)
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.numberOfPages = numberOfPages
        uiView.currentPage = activePage
    }
    
    var numberOfPages: Int
    var activePage: Int
    var onPageChange: (Int) -> ()
    
    func makeUIView(context: Context) -> UIPageControl {
        let view = UIPageControl()
        view.currentPage = activePage
        view.numberOfPages = numberOfPages
        view.backgroundStyle = .prominent
        view.currentPageIndicatorTintColor = UIColor(Color.primary)
        view.pageIndicatorTintColor = UIColor.placeholderText
        view.addTarget(context.coordinator, action: #selector(Coordinator.onPageChange(control:)), for: .valueChanged)
        return view
    }
    
    class Coordinator:NSObject {
        var onPageChange: (Int) -> ()
        init(onPageChange: @escaping (Int) -> Void) {
            self.onPageChange = onPageChange
        }
        @objc
        func onPageChange(control: UIPageControl) {
            onPageChange(control.currentPage)
        }
    }
    
    
    
}
