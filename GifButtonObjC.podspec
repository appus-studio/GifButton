#
#  Be sure to run `pod spec lint gifButton.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

s.name         = "GifButtonObjC"
s.version      = "0.0.2"
s.summary      = "'GifButtonObjC' is an animated buton"
s.homepage     = "https://github.com/alexey-kubas-appus/GifButton"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.author       = { "Kosyi Vlad" => "vlad.kosyi@appus.me" }
s.source       = { :git => "https://github.com/alexey-kubas-appus/GifButton.git", :branch => "master", :tag => s.version.to_s}
s.platform     = :ios, '8.0'
s.requires_arc = true
s.source_files = "GifButton/*.{h,m}"


end
