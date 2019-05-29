#
# Be sure to run `pod lib lint Nibbable.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Nibbable'
  s.version          = '0.2.0'
  s.summary          = 'Auto loader of a XIB file associated to a `UIView`'
  s.swift_version = "5.0"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Simple framework to allow a view to automatically load an associataed xib file when the view is instantiated
                       DESC

  s.homepage         = 'https://github.com/jeden/nibbable'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Antonio Bello' => 'jeden@elapsus.com' }
  s.source           = { :git => 'https://github.com/jeden/nibbable.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/ant_bello'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Nibbable/Classes/**/*'
end
