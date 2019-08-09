# WKWebViewCrawler
## WKWebViewCrawler is iOS web crawler!
WKWebViewCrawler is iOS web crawler. This is powered by WKWebView.

## Requirements
## Install
## Usage

load url.

```swift
    let url = URL(string: "https://qiita.com/")!
    let request = URLRequest(url: url, method: .get, contentType: "text/html")
    client.request(request) { _ in
        // request completion.
    }
```

specify query selector.

```swift
    client.request(request) { _ in
        self.client.filter(selector: ".tr-Item") { elements in
            if let desc = elements?.description {
                print(desc)
            }
        }
    }
```
