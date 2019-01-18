#
# Be sure to run `pod lib lint JJSwiftBaseProject.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JJSwiftBaseProject'
  s.version          = '0.1.2.41'
  s.summary          = 'A short description of JJSwiftBaseProject.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.swift_version    = '4.1'
  s.homepage         = 'https://github.com/snailjj/JJSwiftBaseProject'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'snailjj' => 'snail@snailjj.com' }
  s.source           = { :git => 'https://github.com/snailjj/JJSwiftBaseProject.git', :tag => s.version.to_s }
  s.social_media_url = 'https://www.snailjj.com'
  
  s.ios.deployment_target = '8.0'
  
  # 基础库
  s.subspec 'Base' do |base|
      # 文件目录
      base.source_files =
      'JJSwiftBaseProject/Base/Managers/*.swift',
      'JJSwiftBaseProject/Base/CustomUI/*.swift',
      'JJSwiftBaseProject/Base/Extension/*.swift',
      'JJSwiftBaseProject/Base/Settings/*.swift'
      
      # 依赖库
      base.dependency 'Alamofire'
      base.dependency 'XCGLogger'
      base.dependency 'MJRefresh'
      base.dependency 'KeychainSwift'
  end
  
  # s.resource_bundles = {
  #   'JJSwiftBaseProject' => ['JJSwiftBaseProject/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
end
