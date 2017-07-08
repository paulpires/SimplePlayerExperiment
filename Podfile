# Uncomment the next line to define a global platform for your project

platform :ios, '10.0'

target 'SimplePlayer' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for SimplePlayer

  pod 'RealmSwift'
  #pod 'Siesta', '~> 1.0'

  #pod 'RxSwift',    '~> 3.0'
  #pod 'RxCocoa',    '~> 3.0'

  target 'SimplePlayerTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'SimplePlayerUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['CLANG_WARN_DOCUMENTATION_COMMENTS'] = 'NO'
        end
    end
end
