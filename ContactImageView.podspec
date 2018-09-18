#
# Be sure to run `pod lib lint ContactImageView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ContactImageView'
  s.version          = '0.3.0'
  s.summary          = 'UIImageView subclass which generates text as the placeholder for an ImageView,'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

s.description      = "UIImageView subclass which generates text as the placeholder for an ImageView, supports IBDesignable and code."

  s.homepage         = 'https://github.com/gkye/ContactImageView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '=' => 'gkye@live.ca' }
  s.source           = { :git => 'https://github.com/gkye/ContactImageView.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/kyegeorge'

  s.ios.deployment_target = '8.0'
  s.source_files = 'ContactImageView/ContactImageView.swift'
  s.swift_version = '4.0'
end
