//
//  ProductWebPageViewController.swift
//  RoadMap_Shop
//
//  Created by Артур Щукин on 10.10.2022.
//

import UIKit
import WebKit

/// Экран показа магазина
class ProductWebPageViewController: UIViewController, WKUIDelegate {

    // MARK: - Private properties
    private let webView = WKWebView()
    private let backButtonItem = UIBarButtonItem(systemItem: .rewind)
    private let forwardButtonItem = UIBarButtonItem(systemItem: .fastForward)
    private let spacer = UIBarButtonItem(systemItem: .flexibleSpace)
    private let refreshButtonItem = UIBarButtonItem(systemItem: .refresh)
    private var shareButtonItem = UIBarButtonItem()
    private var progressView = UIProgressView(progressViewStyle: .default)
    private var webViewToolBar = UIToolbar()
    private var progressViewButtonItem = UIBarButtonItem()
    private var observation: NSKeyValueObservation?
    
    // MARK: - Public properties
    var product: Product?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configurateWebView()
        configurateToolBar()
        configurateToolBarItems()
    }
    
    // MARK: - Private methods
    @objc private func goBackAction() {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @objc private func goForwardAction() {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @objc private func refreshAction() {
        webView.reload()
    }
    
    @objc private func shareAction() {
        let activityViewController = UIActivityViewController(activityItems: ["test"], applicationActivities: nil)
        present(activityViewController, animated: true)
    }
    
    private func configurateProgressView() {
    }
    
    private func configurateWebView() {
        guard let productUrl = product?.productLink else { return }
        guard let url = URL(string: productUrl) else { return }
        webView.frame = CGRect(x: 0, y: 25, width: view.bounds.width, height: view.bounds.height)
        webView.translatesAutoresizingMaskIntoConstraints = true
        webView.isUserInteractionEnabled = true
        webView.navigationDelegate = self
        view.addSubview(webView)
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    private func configurateToolBar() {
        webViewToolBar = UIToolbar(frame: CGRect(x: 0, y: 700, width: view.bounds.width, height: 50))
        webViewToolBar.barTintColor = .systemBackground
        webViewToolBar.isTranslucent = false
        progressView.sizeToFit()
        observation = webView.observe(\.estimatedProgress, options: [.new]) { _, _ in
                self.progressView.progress = Float(self.webView.estimatedProgress)
            }
        view.addSubview(webViewToolBar)
    }
    
    private func configurateToolBarItems() {
        shareButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "square.and.arrow.up"),
            style: .done,
            target: self,
            action: nil
        )
        progressViewButtonItem.customView = progressView
        backButtonItem.action = #selector(goBackAction)
        forwardButtonItem.action = #selector(goForwardAction)
        refreshButtonItem.action = #selector(refreshAction)
        shareButtonItem.action = #selector(shareAction)
        webViewToolBar.items = [
            backButtonItem,
            forwardButtonItem,
            spacer,
            progressViewButtonItem,
            spacer,
            shareButtonItem,
            refreshButtonItem]
    }
}

extension ProductWebPageViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        backButtonItem.isEnabled = webView.canGoBack
        forwardButtonItem.isEnabled = webView.canGoForward
    }
}
