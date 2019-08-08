//
//  WebViewController.swift
//  BottleRocket
//
//  Created by Priyanka Chaturvedi on 8/1/19.
//  Copyright © 2019 Priyanka Chaturvedi. All rights reserved.
//

import UIKit
import WebKit
class WebViewController: UIViewController,WKNavigationDelegate {
    
    @IBOutlet weak var nextBtn: UIBarButtonItem!
    @IBOutlet weak var refreshBtn: UIButton!
    @IBOutlet weak var backBtn: UIBarButtonItem!
    
    let webV = UIWebView()
    let url:String = "https://www.bottlerocketstudios.com"
    let refreshControl: UIRefreshControl = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        webViewDisplay()
    }
    
    func webViewDisplay(){
        webV.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        webV.loadRequest(NSURLRequest(url: NSURL(string: url)! as URL) as URLRequest)
        webV.delegate = self as? UIWebViewDelegate
        self.view.addSubview(webV)
    }
    
    @IBAction func backBtnClick(_ sender: Any) {
        if webV.canGoBack{
            webV.goBack()
        }
        
    }
    @IBAction func nextBtnClick(_ sender: Any) {
        if webV.canGoForward{
            webV.goForward()
        }
    }
    
    @IBAction func refreshBtnClick(_ sender: Any) {
        webV.reload()
        webV.scrollView.addSubview(refreshControl)
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        backBtn.isEnabled = webV.canGoBack
        nextBtn.isEnabled = webV.canGoBack
    }
}
