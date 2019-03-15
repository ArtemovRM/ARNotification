Pod::Spec.new do |s|
  s.name                  = "ARNotification"
  s.version               = "0.0.1"
  s.summary               = "Lightweight notification for iOS written in Swift"
  s.homepage              = "https://github.com/ArtemovRM/ARNotification.git"
  s.license               = { :type => 'MIT', :file => 'LICENSE' }
  s.author                = { "Roman Artemov" => "rm.artemov@gmail.com" }
  s.ios.deployment_target = '9.0'
  s.source                = { :git => "https://github.com/ArtemovRM/ARNotification.git", :tag => s.version.to_s }
  s.source_files          = 'Classes/*.{swift}'
  s.resources             = 'Resources/*.{xib,xcassets,bundle}'
  s.framework             = 'Foundation'
  s.requires_arc          = true
end