//
//  ImbdVC.swift
//  Movie Night
//
//  Created by Fathureza Januarza on 8/6/16.
//  Copyright © 2016 tedihouse. All rights reserved.
//

import UIKit
import WebKit

class ImbdVC: UIViewController, WKNavigationDelegate{
    
    var webView: WKWebView!
    var urlStr: String!
    
    override func viewDidLoad() {
    }
    override func viewDidAppear(_ animated: Bool) {
     //   let myBlog = "https://www.google.com/"
        if let urlStr = urlStr{
        let url = NSURL(string: urlStr)
        let request = NSURLRequest(url:  url! as URL)
        
        // init and load request in webview.
        webView = WKWebView(frame: self.view.frame)
        webView.navigationDelegate = self
        webView.load(request as URLRequest)
        self.view.addSubview(webView)
        self.view.sendSubview(toBack: webView)
        }
    }
}
