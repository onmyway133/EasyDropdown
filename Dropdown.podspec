Pod::Spec.new do |s|
  s.name             = "Dropdown"
  s.summary          = "Dropdown in Swift"
  s.version          = "0.2.0"
  s.homepage         = "https://github.com/hyperoslo/Dropdown"
  s.license          = 'MIT'
  s.author           = { "Hyper Interaktiv AS" => "ios@hyper.no" }
  s.source           = {
    :git => "https://github.com/hyperoslo/Dropdown.git",
    :tag => s.version.to_s
  }
  s.social_media_url = 'https://twitter.com/hyperoslo'

  s.ios.deployment_target = '8.0'

  s.requires_arc = true
  s.ios.source_files = 'Sources/**/*'
  s.ios.frameworks = 'UIKit'
  s.ios.resource = 'Sources/Dropdown.bundle'

end
