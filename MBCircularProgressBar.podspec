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
  s.version          = "0.3.5"
  s.summary          = "a circular animatable & IB highly customizable progress bar"
  s.description      = <<-DESC
a circular animatable & Interface Builder highly customizable progress bar
                       DESC
  s.homepage         = "https://github.com/matibot/MBCircularProgressBar"
  s.screenshots     = "https://raw.github.com/matibot/MBCircularProgressBar/master/Readme/example.png", "https://raw.github.com/matibot/MBCircularProgressBar/master/Readme/MBCircularProgressBar.gif"
  s.license          = 'MIT'
  s.author           = { "Mati Bot" => "os@mati.bot" }
  s.source           = { :git => "https://github.com/matibot/MBCircularProgressBar.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/@b0tnik'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Sources/**/*'
  s.resource_bundles = {
    'MBCircularProgressBar' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
