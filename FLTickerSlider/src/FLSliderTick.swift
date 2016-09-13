//
//  FLSliderChunk.swift
//  fileio
//
//  Created by TsuzukiTomoaki on 2016/09/13.
//  Copyright © 2016年 fileio. All rights reserved.
//

import UIKit

public class FLSliderTick {
    
    public enum Shape {
        case Rect
        case Round
    }
    
    var height: CGFloat
    var width: CGFloat
    var offset: CGFloat
    var color: UIColor
    var shape: Shape
    
    public init(offset: CGFloat) {
        self.shape = Shape.Round
        self.height = 10
        self.width = 10
        self.offset = offset
        self.color = UIColor(red: 0.718, green: 0.718, blue: 0.718, alpha: 1)
    }
    
    public init(offset: CGFloat, color: UIColor) {
        self.shape = Shape.Round
        self.height = 10
        self.width = 10
        self.offset = offset
        self.color = color
    }
    
    public init(shape: Shape, width: CGFloat, height: CGFloat, offset: CGFloat, color: UIColor) {
        self.shape = shape
        self.height = height
        self.width = width
        self.offset = offset
        self.color = color
    }
    
    func createTickView(slider: UIView) -> UIView {
        let sliderWidth = slider.frame.size.width
        let sliderHeight = slider.frame.size.height
        let offset = self.offset * sliderWidth - self.width / 2
        
        let tickeView = UIView()
        tickeView.backgroundColor = self.color
        
        var additionalMargin = CGFloat(1.0)        
        tickeView.frame = CGRectMake(offset,
                                     sliderHeight / 2 - self.height / 2 + additionalMargin,
                                     self.width,
                                     self.height)
        return tickeView
    }
    
}
