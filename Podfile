# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'
# ignore all warnings from all pods
inhibit_all_warnings!

def core_pods
    pod 'SwiftLint'
    pod 'SwiftyBeaver'
    pod 'Swinject', '~> 2.1.0'
end

def ui_pods
    pod 'ReactiveCocoa', '7.0.0-alpha.2'
    pod 'NVActivityIndicatorView'
    pod 'SwiftyJSON', '~> 3.1'
    pod 'Alamofire', '~> 4.4'
    pod 'SDWebImage', '~> 4.0'
end

target 'BASwift' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for BASwift
  core_pods
  ui_pods
  target 'BASwiftTests' do
    inherit! :search_paths
    # Pods for testing
  end

end
