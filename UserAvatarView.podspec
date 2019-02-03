Pod::Spec.new do |s|

  s.name        = "UserAvatarView"

  s.version     = "1.2.0"

  s.summary     = "UserAvatarView is a UIView subclass that has customizable status view"

  s.description = "UserAvatarView is a UIView subclass that has status view with customizable appearance, angle, radius"

  s.homepage    = "https://github.com/AntonPoltoratskyi/UserAvatarView"

  s.license     = { :type => "MIT", :file => "LICENSE" }

  s.author      = "Anton Poltoratskyi"

  s.platform    = :ios, "10.0"

  s.source      = { :git => "https://github.com/AntonPoltoratskyi/UserAvatarView.git", :tag => "#{s.version}" }

  s.source_files    = "UserAvatarView/*.{swift}"

  s.framework       = "UIKit"

  s.swift_version   = "4.2"

end
