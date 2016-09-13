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
    
    /// shadow attribute
    public struct Shadow {
        var color: UIColor
        var offset: CGSize
        var opacity: Float
        var radius: CGFloat

        public init(color: UIColor, offset: CGSize, opacity: Float, radius: CGFloat) {
            self.color = color
            self.offset = offset
            self.opacity = opacity
            self.radius = radius
        }
    }
    
    var height: CGFloat
    var width: CGFloat
    var offset: CGFloat
    var color: UIColor
    var shape: Shape
    var shadow: Shadow?
    
    /// public property
    public var alpha: CGFloat = 1.0
    
    /// create ticker
    /// - parameter offset: must be between FLTickerSlider min max value
    public init(offset: CGFloat) {
        self.shape = Shape.Round
        self.height = 10
        self.width = 10
        self.offset = offset
        self.color = UIColor(red: 0.718, green: 0.718, blue: 0.718, alpha: 1)
    }
    
    /// create ticker
    /// - parameter offset: must be between FLTickerSlider min max value
    /// - parameter color: ticker color
    /// - parameter shadow: ticker shadow
    public init(offset: CGFloat, color: UIColor, shadow: Shadow) {
        self.shadow = shadow
        self.shape = Shape.Round
        self.height = 10
        self.width = 10
        self.offset = offset
        self.color = color
    }
    
    /// create ticker
    /// - parameter width: width of ticker in px
    /// - parameter height: height of ticker in px
    /// - parameter offset: must be between FLTickerSlider min max value
    /// - parameter color: ticker color
    /// - parameter shadow: ticker shadow
    public init(offset: CGFloat, color: UIColor, shadow: Shadow, width: CGFloat, height: CGFloat, shape: Shape) {
        self.shape = shape
        self.shadow = shadow
        self.height = height
        self.width = width
        self.offset = offset
        self.color = color
    }
    
    func createTickView(slider: UIView) -> UIView {
        let sliderWidth = slider.frame.size.width
        let sliderHeight = slider.frame.size.height
        let offset = self.offset * sliderWidth - self.width / 2
        
        let tickerView = UIView()
        tickerView.backgroundColor = self.color
        tickerView.alpha = self.alpha
        
        if self.shape == FLSliderTick.Shape.Round {
            tickerView.layer.cornerRadius = self.height / 2;
        }
        
        if self.shadow != nil {
            tickerView.layer.shadowColor = self.shadow!.color.CGColor
            tickerView.layer.shadowOffset = self.shadow!.offset
            tickerView.layer.shadowOpacity = self.shadow!.opacity
            tickerView.layer.shadowRadius = self.shadow!.radius
        }
        
        tickerView.frame = CGRectMake(offset,
                                      sliderHeight / 2 - self.height / 2,
                                      self.width,
                                      self.height)
        return tickerView
    }
    
}
