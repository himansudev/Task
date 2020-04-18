

import UIKit
import WebKit

class WebViewController: UIViewController
{

    @IBOutlet weak var webView: WKWebView!
    
    var htmlCode:String?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

       loadHtmlCode()
    }
    
    func loadHtmlCode()
    {
    
        webView.loadHTMLString(htmlCode!, baseURL: nil)
       
    }

}
