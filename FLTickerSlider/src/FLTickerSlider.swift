//
//  FLSliderView.swift
//  fileio
//
//  Created by TsuzukiTomoaki on 2016/09/13.
//  Copyright © 2016年 fileio. All rights reserved.
//

import UIKit

open class FLTickerSlider: UISlider {
    
    fileprivate var tickers: Array<FLSliderTick>?
    fileprivate var tickerViews: Array<UIView> = []
    
    override open func draw(_ rect: CGRect) {
        super.draw(rect)
        self.displayTickers()
    }
    
    /// set tickers
    /// - parameter tickers: FLSliderTick in Array
    open func set(tickers: Array<FLSliderTick>) {
        self.tickers = tickers
        
        guard let _ = self.getThumbnailView() else {
            return
        }
        self.displayTickers()
    }
    
    /// get tickers
    open func get() -> Array<FLSliderTick> {
        guard  let tickers = self.tickers else {
            return []
        }
        return tickers
    }
    
    /// re-draw tickers
    open func redraw() {
        self.displayTickers()
    }
    
    // MARK : private
    
    fileprivate func displayTickers() {
        self.removeAllTicker()
        
        guard let ticks = self.tickers else {
            return
        }
        
        for tick in ticks {
            self.display(tick: tick)
        }
    }
    
    fileprivate func display(tick: FLSliderTick) {
        if Float(tick.offset) > self.maximumValue {
            return
        }
        
        guard let thumbnailView = self.getThumbnailView() else {
            return
        }
        
        let thumbRect = self.getThumbRect()
        let tickerView = tick.createTickView(slider: self, thumbRect: thumbRect)
        insertSubview(tickerView, belowSubview: thumbnailView)
        self.tickerViews.append(tickerView)
    }

    fileprivate func getThumbnailView() -> UIView? {
        let thumbRect = self.getThumbRect()
        
        for view in self.subviews {
            if view.isKind(of: UIImageView.self) && view.frame == thumbRect {
                return view
            }
        }
        return nil
    }
    
    fileprivate func removeAllTicker() {
        for tickerView in self.tickerViews {
            tickerView.removeFromSuperview()
        }
        self.tickerViews.removeAll()
    }
    
    fileprivate func getThumbRect() -> CGRect {
        let trackRect = self.trackRect(forBounds: self.bounds)
        let thumbRect = self.thumbRect(forBounds: self.bounds, trackRect: trackRect, value: self.value)
        
        return thumbRect
    }
    
}
