Pod::Spec.new do |s|
  s.name         = "FLTickerSlider"
  s.version      = "0.0.1"
  s.summary      = "Simple and light weight slider with ticker"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.homepage     = "https://github.com/fileio/FLTickerSlider"
  s.author       = { "tsuzuki" => "tsuzuki@fileio.io" }
  s.source       = { :git => "https://github.com/fileio/FLTickerSlider.git", :tag => "#{s.version}" }
  s.platform     = :ios, '8.0'
  s.source_files = 'FLTickerSlider/**/*.{h,m,swift}'
end
