Pod::Spec.new do |s|  
  s.name             = "ParseDictToModel"  
  s.version          = "1.0.0"  
  s.summary          = "A marquee view used on iOS."  
  s.description      = " It is a marquee view used on iOS, which implement by Objective-C.  "
                        
  s.homepage         = "https://github.com/james1010/parseDictToModel.git"   
  s.license          = 'James'  
  s.author           = { "James" => "james_1010@126.com" }  
  s.source           = { :git => "https://github.com/james1010/parseDictToModel.git", :tag => s.version.to_s }  
  # s.social_media_url = 'https://twitter.com/NAME'  
  
  s.platform     = :ios, '6.0'  
  # s.ios.deployment_target = '5.0'  
  # s.osx.deployment_target = '10.7'  
  s.requires_arc = true  
  
  s.source_files = 'ParseDictToModel/*'  
  
  s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit'  
  
end 
