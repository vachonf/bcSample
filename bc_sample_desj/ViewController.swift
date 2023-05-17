import UIKit
import WebKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let button = UIButton(type: .system)
        button.setTitle("Push VC A", for: .normal)
        button.addTarget(self, action: #selector(pushWebView), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(button)
        
        
        let buttonB = UIButton(type: .system)
        buttonB.setTitle("Push VC B", for: .normal)
        buttonB.addTarget(self, action: #selector(pushWebViewB), for: .touchUpInside)
        buttonB.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(buttonB)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            buttonB.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonB.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50.0)
        ])
    }
    
    
    @objc func pushWebView() {
        let webViewVC = WebViewControllerA()
        navigationController?.pushViewController(webViewVC, animated: true)
    }
    
    @objc func pushWebViewB() {
        let webViewVC = WebViewControllerB()
        navigationController?.pushViewController(webViewVC, animated: true)
    }
}

class WebViewControllerA: UIViewController {
    private var webViewA: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        webViewA = WKWebView(frame: view.bounds)
        webViewA.navigationDelegate = self
        view.addSubview(webViewA)
        
        if let url = URL(string: "https://www.google.com") {
            webViewA.load(URLRequest(url: url))
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        webViewA.navigationDelegate = nil
    }
}

extension WebViewControllerA: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction,
                 decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let url = navigationAction.request.url {
            print("WebViewControllerA Navigating to: \(url.absoluteString)")
        }
        decisionHandler(.allow)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("WebViewControllerA Started loading")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("WebViewControllerA Finished loading")
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("WebViewControllerA Failed loading: \(error.localizedDescription)")
    }
}




class WebViewControllerB: UIViewController {
    private var webViewB: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        webViewB = WKWebView(frame: view.bounds)
        webViewB.navigationDelegate = self
        view.addSubview(webViewB)
        
        if let url = URL(string: "https://www.bing.com") {
            webViewB.load(URLRequest(url: url))
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        webViewB.navigationDelegate = nil
    }
}

extension WebViewControllerB: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction,
                 decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let url = navigationAction.request.url {
            print("WebViewControllerB Navigating to: \(url.absoluteString)")
        }
        decisionHandler(.allow)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("WebViewControllerB Started loading")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("WebViewControllerB Finished loading")
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("WebViewControllerB Failed loading: \(error.localizedDescription)")
    }
}


