//
//  ViewController.swift
//  Swift6WKWebView1
//
//  Created by 山本怜 on 2020/11/04.
//

import UIKit
import WebKit

class ViewController: UIViewController,WKNavigationDelegate {
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    var webView = WKWebView()

    @IBOutlet weak var toolBar: UIToolbar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        indicator.isHidden = true
        
        //大きさを決めていく
        webView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height - toolBar.frame.size.height)
       
        view.addSubview(webView)
        
        webView.navigationDelegate = self
        
        //URLは初めはString型だからロードするためにString型からURL型にする→urlインスタンス生成
        let url = URL(string: "https://www.kurashiru.com/")
        //URLRequestクラスにセット→requestインスタンス生成
        let request = URLRequest(url: url!)
        //WebViewにrequestをロード
        webView.load(request)
        
        //indicatorの階層がwebViewより奥なので隠れている→手前にする
        indicator.layer.zPosition = 2
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        //ロードが完了した時に呼ばれるデリゲートメソッド
        indicator.isHidden = true
        indicator.stopAnimating()
        
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        //読み込みが開始された時に呼ばれるデリゲートメソッド
        indicator.isHidden = false
        indicator.startAnimating()
    }

    @IBAction func back(_ sender: Any) {
        webView.goBack()
    }
    
    @IBAction func go(_ sender: Any) {
        webView.goForward()
    }
    
    
    

}

