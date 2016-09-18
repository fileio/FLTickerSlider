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
        
        guard let _ = self.getReferenceView() else {
            return
        }
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
        
        guard let referenceView = self.getReferenceView() else {
            return
        }
        
        let tickerView = tick.createTickView(slider: self)
        insertSubview(tickerView, belowSubview: referenceView)
        self.tickerViews.append(tickerView)
    }

    fileprivate func getReferenceView() -> UIView? {
        for view in self.subviews {
            if view.isKind(of: UIImageView.self) && view.frame.size.height == view.frame.size.width {
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
    
}
