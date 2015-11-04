#
# Be sure to run `pod lib lint BBStringChecker.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "BBStringChecker"
  s.version          = "1.9"
  s.summary          = "Email and password validation"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
			String Catergory for password and email validation. Useful for signup and login.
			DESC
  s.homepage         = "https://github.com/bryanboyko/BBStringChecker"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license      = { :type => 'Apache License, Version 2.0', :text => <<-LICENSE
  	  Licensed under the Apache License, Version 2.0 (the "License");
    	you may not use this file except in compliance with the License.
    	You may obtain a copy of the License at

    	http://www.apache.org/licenses/LICENSE-2.0

   	 Unless required by applicable law or agreed to in writing, software
    	distributed under the License is distributed on an "AS IS" BASIS,
    	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    	See the License for the specific language governing permissions and
    	limitations under the License.
    	LICENSE
  	}
  s.author           = { "bryanboyko" => "bryan.boyko@gmail.com" }
  s.source           = { :git => "https://github.com/bryanboyko/BBStringChecker.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'BBStringChecker' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
