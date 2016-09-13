Simple and light weight slider with ticker

# Appearance
![screen shot](screeen_shot.png)

# Usage

```
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
```

# LICENSE

FLTickerSlider is available under the MIT license. See the LICENSE file for more info.
