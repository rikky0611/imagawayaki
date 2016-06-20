//
//  ScreenShotUtil.swift
//  imagawayaki
//
//  Created by 荒川陸 on 2016/06/20.
//  Copyright © 2016年 mikan-laboratories. All rights reserved.
//

import Foundation
import UIKit

struct ScreenCaptureUtil {
    static func take()->UIImage{
        
        //キャプチャ取得.変数screenshotにUIImageが保存されます
        let layer = UIApplication.sharedApplication().keyWindow!.layer
        let scale = UIScreen.mainScreen().scale
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, scale);
        
        layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let screenshot = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        
        return screenshot;
        
    }
    
}
