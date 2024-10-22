import SwiftUI
import WebKit

struct GifImage: UIViewRepresentable {
    private let gifName: String

    init(_ gifName: String) {
        self.gifName = gifName
    }

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        
        // Ensure the gif is located in the main bundle, not assets
        if let gifURL = Bundle.main.url(forResource: gifName, withExtension: "gif") {
            if let gifData = try? Data(contentsOf: gifURL) {
                webView.load(gifData, mimeType: "image/gif", characterEncodingName: "UTF-8", baseURL: gifURL.deletingLastPathComponent())
            }
        }
        
        webView.isUserInteractionEnabled = false  // Disable interaction with the gif
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        // Not needed for this case
    }
}

