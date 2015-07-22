#
# Be sure to run `pod lib lint MBCircularProgressBar.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "MBCircularProgressBar"
  s.version          = "0.1.1"
  s.summary          = "a beautiful circular animatable progress bar that uses IBDesignable"
  s.description      = <<-DESC
            a beautiful circular animatable progress bar that uses IBDesignable and custom core graphics drawing
                       DESC
  s.homepage         = "https://github.com/matibot/MBCircularProgressBar"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Mati Bot" => "matibot@gmail.com" }
  s.source           = { :git => "https://github.com/matibot/MBCircularProgressBar.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/@b0tnik'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'MBCircularProgressBar' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
