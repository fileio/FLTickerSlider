//
//  FLSliderChunk.swift
//  fileio
//
//  Created by TsuzukiTomoaki on 2016/09/13.
//  Copyright © 2016年 fileio. All rights reserved.
//

import UIKit

open class FLSliderTick {
    
    public enum Shape {
        case rect
        case round
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
    
    open var height: CGFloat
    open var width: CGFloat
    open var offset: CGFloat
    open var color: UIColor
    open var shape: Shape
    open var shadow: Shadow?
    open var alpha: CGFloat = 1.0
    
    /// create ticker
    /// - parameter offset: must be between FLTickerSlider min max value
    public init(offset: CGFloat) {
        self.shape = Shape.round
        self.height = 10
        self.width = 10
        self.offset = offset
        self.color = UIColor(red: 0.718, green: 0.718, blue: 0.718, alpha: 1)
    }
    
    /// create ticker
    /// - parameter offset: must be between FLTickerSlider min max value
    /// - parameter color: ticker color
    /// - parameter shadow: ticker shadow
    public init(offset: CGFloat, color: UIColor, shadow: Shadow?) {
        self.shadow = shadow
        self.shape = Shape.round
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
    public init(offset: CGFloat, color: UIColor, shadow: Shadow?, width: CGFloat, height: CGFloat, shape: Shape) {
        self.shape = shape
        self.shadow = shadow
        self.height = height
        self.width = width
        self.offset = offset
        self.color = color
    }
    
    func createTickView(slider: FLTickerSlider, thumbRect: CGRect) -> UIView {
        let thumbWidth = thumbRect.size.width
        let sliderWidth = slider.frame.size.width - thumbWidth
        let sliderHeight = slider.frame.size.height
        let offset = self.offset * sliderWidth - self.width / 2 + thumbWidth / 2
        
        let tickerView = UIView()
        tickerView.backgroundColor = self.color
        tickerView.alpha = self.alpha
        
        if self.shape == FLSliderTick.Shape.round {
            tickerView.layer.cornerRadius = self.height / 2;
        }
        
        if self.shadow != nil {
            tickerView.layer.shadowColor = self.shadow!.color.cgColor
            tickerView.layer.shadowOffset = self.shadow!.offset
            tickerView.layer.shadowOpacity = self.shadow!.opacity
            tickerView.layer.shadowRadius = self.shadow!.radius
        }
        
        tickerView.frame = CGRect(x: offset,
                                  y: sliderHeight / 2 - self.height / 2,
                                  width: self.width,
                                  height: self.height)
        return tickerView
    }
    
}
