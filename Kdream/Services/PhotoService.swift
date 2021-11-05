//
//  PhotoService.swift
//  Kdream
//
//  Created by Kasatin on 17.10.2021.
//

import Foundation
import UIKit


private let imageCache = NSCache<NSString, NSData>()

class PhotoService{
    
    public static func loadPhotoFromUrl(_url: String, completion: @escaping ( (UIImage) -> Void)) {
        let cacheID = NSString(string: _url)
        var imgFromNet = UIImage()

        if let imageFromCache = imageCache.object(forKey: cacheID){
            imgFromNet = UIImage(data: imageFromCache as Data)!
            completion(imgFromNet)
            return
        }

        if let url = URL(string: _url) {

            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async {
                    imgFromNet = UIImage(data: data) ?? UIImage(named: "img-user")!
                    imageCache.setObject(data as NSData, forKey: cacheID)
                    completion(imgFromNet)
//                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newDataNotif"), object: nil)
                }
            }
            task.resume()
        }
    }
    
    func loadPhotoFromUrlClouser(_url: String, _ completion: @escaping (UIImage) -> Void) {
        let cacheID = NSString(string: _url)
        var imgFromNet = UIImage()
        
        if let imageFromCache = imageCache.object(forKey: cacheID){
            imgFromNet = UIImage(data: imageFromCache as Data)!
        }
        
        if let url = URL(string: _url) {
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async {
                    imgFromNet = UIImage(data: data) ?? UIImage(named: "img-user")!
                    imageCache.setObject(data as NSData, forKey: cacheID)
                    completion(imgFromNet)
                    
//                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newDataNotif"), object: nil)
                }
            }
            task.resume()
        }
    }
}

extension UIImageView {
  func enableZoom() {
    let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(startZooming(_:)))
    isUserInteractionEnabled = true
    addGestureRecognizer(pinchGesture)
  }

  @objc
  private func startZooming(_ sender: UIPinchGestureRecognizer) {
    let scaleResult = sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale)
    guard let scale = scaleResult, scale.a > 1, scale.d > 1 else { return }
    sender.view?.transform = scale
    sender.scale = 1
  }
}
