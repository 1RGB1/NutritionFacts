# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'NutritionFacts' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  pod 'ProgressHUD'
  pod 'Alamofire'

  target 'NutritionFactsTests' do
    inherit! :search_paths
    # Pods for testing
  end
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            if config.name == 'Test'
                config.build_settings['ENABLE_TESTABILITY'] = 'YES'
            end
        end
    end
end
