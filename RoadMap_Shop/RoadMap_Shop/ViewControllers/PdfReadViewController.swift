//
//  PdfReadViewController.swift
//  RoadMap_Shop
//
//  Created by Артур Щукин on 11.10.2022.
//

import UIKit
import WebKit

/// Экран просмотра PDF файла
class PdfReadViewController: UIViewController {
    
    // MARK: - Private properties
    private let webView = WKWebView()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPdf()
    }
    
    // MARK: - Private methods
    private func loadPdf() {
        guard let pdfUrl = Bundle.main.url(forResource: "usov", withExtension: "pdf") else { return }
        let pdfRequest = URLRequest(url: pdfUrl)
        webView.backgroundColor = .white
        webView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        webView.load(pdfRequest)
        view.addSubview(webView)
    }
}
