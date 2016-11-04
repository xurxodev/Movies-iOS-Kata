//
//  ImageDownloader.swift
//  MoviesiOSKata
//
//  Created by Jorge Sánchez on 3/11/16.
//  Copyright © 2016 xurxodev. All rights reserved.
//

import UIKit

class ImageDownloader{
    
    var url:NSURL?;

    func load (urlString:String)-> Self{
        
        self.url = NSURL(string: urlString)!
        
        return self;
    }
    
    func into(imageView:UIImageView, cell:UITableViewCell){

        let request = NSURLRequest(URL: url!)
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            if error == nil {
                imageView.image = UIImage(data: data!)
                cell.setNeedsLayout()
                cell.layoutIfNeeded()
            }
        })
        
        task.resume()
    }
}