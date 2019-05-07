Pod::Spec.new do |s|
  s.name             = 'BASwift'
  s.version          = '0.4.1'
  s.summary          = 'BASwift Framework'


  s.homepage         = 'https://github.com/brkakkaya/BASwift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Burak AKKAYA' => 'brk.akkaya@gmail.com' }
  s.source           = { :git => 'https://github.com/brkakkaya/BASwift.git', :tag => s.version.to_s }

 `echo "4.2" > .swift-version`

  s.ios.deployment_target = '9.0'
  s.requires_arc = true
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.ios.frameworks = 'UIKit', 'Foundation'
  s.default_subspec = 'Core'

  s.subspec 'Alamofire' do |as|
    as.source_files = 'BASwift/Alamofire/**/*.swift', 'BASwif/Alamofire/**/**/*.swift'
    as.dependency 'Alamofire', '~> 4.4'
    as.dependency "BASwift/Core"
  end

  s.subspec 'SDWebImage' do |ss|
    ss.source_files = 'BASwift/SDWebImage/*.swift'
    ss.dependency 'SDWebImage', '~> 4.0'
    ss.dependency "BASwift/Core"
  end

  s.subspec 'Realm' do |rs|
    rs.source_files = 'BASwift/Realm/*.swift'
    rs.dependency 'RealmSwift'
    rs.dependency "BASwift/Core"
  end


  s.subspec 'Core' do |cs|
    cs.source_files = 'BASwift/Core/**/*.swift', 'BASwift/Core/**/**/*.swift', 'BASwift/Core/**/**/**/*.swift'
    cs.resources = 'BASwift/Core/**/*.xib', 'BASwift/Core/**/**/*.xib'
    cs.dependency 'NVActivityIndicatorView'
  end

end
