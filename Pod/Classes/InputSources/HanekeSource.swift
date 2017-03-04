//
//  KingfisherSource.swift
//  ImageSlideshow
//
//  Created by webjunkie
//
//

import Haneke

/// Input Source to image using Haneke
public class HanekeSource: NSObject, InputSource {
    var url: NSURL
    var format = Format<UIImage>(name: "original")
    /// Initializes a new source with a URL
    /// - parameter url: a url to be loaded
    public init(url: NSURL) {
        self.url = url
        super.init()
    }


    /// Initializes a new source with a URL string
    /// - parameter urlString: a string url to be loaded
    public init?(urlString: String) {
        if let validUrl = NSURL(string: urlString) {
            self.url = validUrl
            super.init()
        } else {
            //super.init()
            return nil
        }
    }

    public func setToImageView(imageView: UIImageView ) {
        imageView.hnk_setImageFromURL(self.url, format: self.format, success: { (image) -> Void in
            imageView.image = image
        })


    }
}
