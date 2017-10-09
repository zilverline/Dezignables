Pod::Spec.new do |s|
  s.name             = "Dezignables"
  s.version          = "3.1.0"
  s.summary          = "A collection of @IBDesignables"

  s.description      = <<-DESC
  A collection of @IBDesignable components I use often in all my projects. For now it includes a UIView, UIButton and UIImageView.
                       DESC

  s.homepage         = "https://github.com/zilverline/Dezignables"
  s.license          = 'MIT'
  s.author           = { "Daniel van Hoesel" => "daniel@danielvanhoesel.nl" }
  s.source           = { :git => "https://github.com/zilverline/Dezignables.git", :tag => s.version.to_s }

  s.platform     = :ios, '9.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
end
