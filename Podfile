# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'
# ignore all warnings from all pods
inhibit_all_warnings!

def core_pods
    pod 'SwiftLint'
end

def ui_pods
    pod 'NVActivityIndicatorView'
    pod 'Alamofire', '~> 4.4'
    pod 'SDWebImage', '~> 4.0'
    pod 'RealmSwift'
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
