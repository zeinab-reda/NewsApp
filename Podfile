# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'NewsAppTask' do
  # Comment the next line if you don't want to use dynamic frameworks

  def common_pods()
  pod 'RxSwift'
  pod 'Moya/RxSwift'
  pod 'AlamofireImage'
  pod 'JGProgressHUD'
  pod 'OHHTTPStubs/Swift', '~> 8.0.0'
  end

  use_frameworks!

  # Pods for NewsAppTask
  common_pods

  target 'NewsAppTaskTests' do
    inherit! :search_paths
    # Pods for testing
    common_pods
    pod 'Quick'
    pod 'Nimble'
    pod 'RxTest'
  end

  target 'NewsAppTaskUITests' do
    # Pods for testing
  end

end
