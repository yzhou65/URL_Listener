//
//  AndyWebViewController.swift
//  URL_Listener
//
//  Created by Yue Zhou on 8/7/17.
//  Copyright © 2017 Yue Zhou. All rights reserved.
//

import UIKit

class AndyWebViewController: UIViewController, UIWebViewDelegate {
    
    var url: URL
    
    init(url: URL) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // For debugging
        view.backgroundColor = UIColor.red
        
        addWebView()
    }
    
    
    private func addWebView() {
        let webview = UIWebView(frame: view.bounds)
        let request = URLRequest(url: url)
        webview.loadRequest(request)
        webview.delegate = self
        
        view.addSubview(webview)
    }
    
    
    // MARK: UIWebViewDelegate
    func webViewDidStartLoad(_ webView: UIWebView) {
        print(#function)
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print(#function)
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        print(#function)
        
        // If connection fails, create a button to reload and call addWebView()
        // Or jumps to network settings, or remind users of the internet status
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
