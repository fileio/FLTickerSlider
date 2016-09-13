//
//  ViewController.swift
//  FLTickerSliderDemo
//
//  Created by TsuzukiTomoaki on 2016/09/13.
//  Copyright © 2016年 fileio. All rights reserved.
//

import UIKit
import FLTickerSlider

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tickerSlider = FLTickerSlider.init(frame: CGRectMake(0, self.view.frame.size.height / 2, self.view.frame.size.width, 40))
        self.view.addSubview(tickerSlider)
        
        let shadow = FLSliderTick.Shadow(color: UIColor.blueColor(),
                                         offset: CGSizeMake(0.0, 0.0),
                                         opacity: 0.8,
                                         radius: 2.0)
        
        let tick0 = FLSliderTick(offset: 0.4)
        let tick1 = FLSliderTick(offset: 0.5,
                                 color: UIColor.redColor(),
                                 shadow: shadow)
        let tick2 = FLSliderTick(offset: 0.6,
                                 color: UIColor.blueColor(),
                                 shadow: shadow,
                                 width: 12,
                                 height: 12,
                                 shape: FLSliderTick.Shape.Rect)
        let tick3 = FLSliderTick(offset: 0.7,
                                 color: UIColor.blueColor(),
                                 shadow: shadow,
                                 width: 20,
                                 height: 16,
                                 shape: FLSliderTick.Shape.Rect)
        tick3.alpha = 0.5
        tickerSlider.setTickers([
            tick0,
            tick1,
            tick2,
            tick3
            ])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

