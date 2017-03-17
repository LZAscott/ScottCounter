
Pod::Spec.new do |s|

  s.name         = "ScottCounter"
  s.version      = "0.0.1"
  s.summary      = "一款优雅地显示数字、金额变动的控件，支持UILabel和UIButton。"
  s.homepage     = "https://github.com/LZAscott/ScottCounter.git"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Scott_Mr" => "a632845514@vip.qq.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/LZAscott/ScottCounter.git", :tag => s.version}
  s.source_files  = "ScottCounter/ScottCounter/**/*.{h,m}"
  s.requires_arc = true

end
