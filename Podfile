platform :ios, '10.0'

target 'TheMovieDB' do
  use_frameworks!

  pod 'Alamofire', '5.0.0-beta.5'
  pod 'SDWebImage', '~> 4.0'
  pod 'NVActivityIndicatorView'
  pod 'Sentry', :git => 'https://github.com/getsentry/sentry-cocoa.git', :tag => '4.4.1'

  target 'TheMovieDBTests' do
    inherit! :search_paths
    pod 'iOSSnapshotTestCase'
  end

end
