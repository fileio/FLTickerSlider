//
//  FLSliderView.swift
//  fileio
//
//  Created by TsuzukiTomoaki on 2016/09/13.
//  Copyright © 2016年 fileio. All rights reserved.
//

import UIKit

public class FLTickerSlider: UISlider {
    
    private var tickers: Array<FLSliderTick>?
    private var tickerViews: Array<UIView> = []
    
    override public func drawRect(rect: CGRect) {
        super.drawRect(rect)
        self.displayTickers()
    }
    
    /// set tickers
    /// - parameter tickers: FLSliderTick in Array
    public func setTickers(tickers: Array<FLSliderTick>) {
        self.tickers = tickers
        
        guard let _ = self.getReferenceView() else {
            return
        }
        self.displayTickers()
    }
    
    // MARK : private
    
    private func displayTickers() {
        self.removeAllTicker()
        
        guard let ticks = self.tickers else {
            return
        }
        
        for tick in ticks {
            self.displayTicker(tick)
        }
    }
    
    private func displayTicker(tick: FLSliderTick) {
        if Float(tick.offset) > self.maximumValue {
            return
        }
        
        guard let referenceView = self.getReferenceView() else {
            return
        }
        
        let tickerView = tick.createTickView(self)
        insertSubview(tickerView, belowSubview: referenceView)
        self.tickerViews.append(tickerView)
    }

    private func getReferenceView() -> UIView? {
        for view in self.subviews {
            if view.isKindOfClass(UIImageView) && view.frame.size.height == view.frame.size.width {
                return view
            }
        }
        return nil
    }
    
    private func removeAllTicker() {
        for tickerView in self.tickerViews {
            tickerView.removeFromSuperview()
        }
        self.tickerViews.removeAll()
    }
    
}
