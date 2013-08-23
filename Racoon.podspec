Pod::Spec.new do |s|
  s.name         = "Racoon"
  s.version      = "0.0.1"
  s.summary      = "Simple Dependency Injection Framework"
  s.homepage     = "https://github.com/rsobik/Racoon"
  s.license      = 'BSD'
  s.author       = { "Raphael Sobik" => "raphael@sobik.org" }

  s.platform     = :ios
  s.platform     = :ios, '5.0'

  s.source       = { :git => "https://github.com/rsobik/Racoon.git", :tag => s.version.to_s }

  s.source_files  = 'Racoon/*.{h,m}'

  s.public_header_files = 'Racoon/RCOFactory.h', 'Racoon/Racoon.h'
  s.requires_arc = true
end
