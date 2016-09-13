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
        
        let tick0 = FLSliderTick(offset: 0.4)
        let tick1 = FLSliderTick(offset: 0.5,
                                 color: UIColor.redColor())
        let tick2 = FLSliderTick(shape: FLSliderTick.Shape.Rect,
                                 width: 8,
                                 height: 8,
                                 offset: 0.6,
                                 color: UIColor.blueColor())
        let tick3 = FLSliderTick(shape: FLSliderTick.Shape.Rect,
                                 width: 4,
                                 height: 16,
                                 offset: 0.7,
                                 color: UIColor.blueColor())
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

