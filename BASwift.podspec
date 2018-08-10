Pod::Spec.new do |s|
  s.name             = 'BASwift'
  s.version          = '0.2.5.2'
  s.summary          = 'BASwift Framework'


  s.homepage         = 'https://innersource.accenture.com/projects/IXMA/repos/baswift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Burak AKKAYA' => 'brk.akkaya@gmail.com' }
  s.source           = { :git => 'https://burak.akkaya@innersource.accenture.com/scm/ixma/baswift', :tag => s.version.to_s }

 `echo "4.0" > .swift-version`

  s.ios.deployment_target = '9.0'
  s.requires_arc = true

  s.source_files = 'BASwift/Core/**/*.swift', 'BASwift/Core/**/**/*.swift', 'BASwift/Core/**/**/**/*.swift', 'BASwift/UI/**/*.swift', 'BASwift/UI/**/**/*.swift'
  s.resources = 'BASwift/UI/**/*.xib', 'BASwift/UI/**/**/*.xib'
  s.dependency 'NVActivityIndicatorView'
  s.dependency 'Alamofire', '~> 4.4'
  s.dependency 'SDWebImage', '~> 4.0'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
end
