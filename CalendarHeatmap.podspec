#
# Be sure to run `pod lib lint CalendarHeatmap.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CalendarHeatmap'
  s.version          = '0.1.1'
  s.summary          = 'A calendar based heatmap chart written in swift.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
'CalendarHeatmap is a calendar based heatmap which presenting a time series of data points in colors, inspired by Github contribution chart, and written in Swift.'
                       DESC

  s.homepage         = 'https://github.com/Zacharysp/CalendarHeatmap'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Zacharysp' => 'dongjiezach@gmail.com' }
  s.source           = { :git => 'https://github.com/Zacharysp/CalendarHeatmap.git', :tag => s.version.to_s }

  s.source_files = 'CalendarHeatmap/Classes/**/*'
  s.swift_version = '5.0'
  s.ios.deployment_target = '11.0'
  s.frameworks = 'UIKit'
  
end
