Pod::Spec.new do |s|
  s.name         = 'AuthKit'
  s.version      = '0.0.1'
  s.summary      = 'Authentication library for iOS.'
  s.homepage     = 'https://github.com/RCacheaux/AuthKit'
  s.author       = { 'René Cacheaux' => 'rene.cacheaux@gmail.com' }
  s.source       = { :git => 'https://github.com/RCacheaux/AuthKit.git', :tag => '0.0.1' }
  s.platform     = :ios
  s.source_files = 'AuthKit/AuthKit/Source/Classes/Accounts','AuthKit/AuthKit/Source/Classes/AuthController','AuthKit/AuthKit/Source/Classes/AuthUI','AuthKit/AuthKit/Source/Classes/DataPartitions'
  s.requires_arc = true
end
