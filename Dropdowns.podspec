Pod::Spec.new do |s|
  s.name             = "Dropdowns"
  s.summary          = "Fantastic dropdown in Swift"
  s.version          = "3.1.1"
  s.homepage         = "https://github.com/onmyway133/Dropdowns"
  s.license          = 'MIT'
  s.author           = { "Khoa Pham" => "onmyway133@gmail.com" }
  s.source           = {
    :git => "https://github.com/onmyway133/Dropdowns.git",
    :tag => s.version.to_s
  }
  s.social_media_url = 'https://twitter.com/onmyway133'

  s.ios.deployment_target = '9.0'

  s.requires_arc = true
  s.ios.source_files = 'Sources/**/*.swift'
  s.ios.frameworks = 'UIKit'
  s.ios.resource = 'Sources/Dropdown.bundle'

  s.swift_version = '5.0'

end
