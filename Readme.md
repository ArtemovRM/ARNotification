
[![Build Status](https://travis-ci.org/ArtemovRM/ARNotification.svg?branch=master)](https://travis-ci.org/ArtemovRM/ARNotification)
[![License](https://img.shields.io/cocoapods/l/ARNotification.svg?color=green)](https://cocoapods.org/pods/ARNotification)
[![Swift Version](https://img.shields.io/badge/swift-4.0-orange.svg)](https://developer.apple.com/swift/)

# ARNotification 

Lightweight notification for iOS written in Swift 

## Requirements

iOS 9.0+

## Install
###### Via CocoaPods.

To install ARNotification with CocoaPods, add the following lines to your Podfile: 
``` ruby
pod 'ARNotification'
```

###### Via Carthage.
``` ruby
github "ArtemovRM/ARNotification"
```

## Example

For example, set a window for notifications in didFinishLaunchingWithOptions

``` swift
import ARNotification

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
  // Override point for customization after application launch.
  ARNotification.shared.window = self.window
  
  var settings = ARNotificationSettings()
  settings.position = ARNotificationPosition.bottom
		
  ARNotification.shared.settings = settings
  
  return true
}
```

Next

``` swift
ARNotification.shared.push(type: .error, title: "Unknown error")
``` 

![](https://github.com/ArtemovRM/ARNotification/blob/master/Examples.gif)
