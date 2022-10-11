//  SafariWebView.swift
//  VisualElements
//  Created by cturrion on 10/10/22.

import SwiftUI
import SafariServices


struct SafariWebView: UIViewControllerRepresentable {
    let url: String
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: URL(string: url)!)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        
    }
}
