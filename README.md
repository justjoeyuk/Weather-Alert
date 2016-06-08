### Limitations

- Minimum iOS Version: 8.1
- XCode 7.3 (Swift Compiler 2.2)

### Installation

Install Carthage ( https://github.com/Carthage/Carthage )

Run the following commands:

```gem install cocoapods --pre```

```carthage bootstrap --no-build```

```carthage update --no-skip-current --platform iOS```

```pod install```

The --no-skip-current in Carthage is simply because the latest XCode versions don't like the downloaded frameworks, so building from scratch solves a few problems. Should be fixed in next version of XCode.

If you need to use an old version of CocoaPods after using this application, run ```gem uninstall cocoapods``` and select the pre-release version you have just downloaded.

### Known Issues

Visit the "Issues" tab to see issues I am aware of an I am currently working to fix.


### Report

#### Notes
When I was initially designing the application, I had assumed that I was able to get the 16 day forecast with my API key, which I am not (unless I register for the FOSS key). This means I have had to degrade the design as I am only able to get a forecast for 5 days.

The app is a WIP, there are many things I want to improve and a number of things will be fixed within the next day or so. If you want to see areas of code I'm not comfortable with, you can do a search for **TODO:** and you should have a small number of results where I had wanted to improve some of the code.


#### Code

##### Layout
You will also notice that I have 0 xib/nib files and no storyboard. This is my personal preference. I do this for the ease of maintainable code. If you're in a team, and you're using storyboards, it can become very difficult to see what has changed in the source control.

##### Configurations
The application has 4 configurations. This is not necessary at all but it's to show what a standard project of mine looks like. I typically have different configuration files with different sets of API keys and such.


#### Dependency Management

##### Cocoapods
**Note: Install the latest CocoaPods.**

Personally, I would like to avoid the use of Cocoapods. I do this because I don't like the micro-management it has on the project and it's single point of failure. I couldn't avoid it however, since Google use it as the official channel for the places SDK. I have familiarity with Cocoapods but I prefer Carthage.

##### Carthage
I used Carthage as my primary package manager in this particular project. I like the idea of Carthage because of the simplicity. I wanted to explore it some more and I used this project for that. It's also much easier to maintain when you have multiple app configurations.


#### Libraries/APIs

##### Google Places
You will notice that I use Google Places in the application to fetch the city names. This is because OpenWeather API have some very strict limits. I didn't want to degrade user experience by not having auto-complete so I used Google Places.

##### Flickr
I use the Flickr API to search for images that contain that city. It's not perfect but it's good. I originally did geo-searches but they were worse.

##### Realm
I have used Realm as the mobile database of choice. I prefer anything over Core Data and I've become very familiar with it (Realm.io). It's fast and efficient and a pleasure to work with.

##### SnapKit
I used SnapKit (snapkit.io) for layout. It's a great Auto-layout library which allows the NSLayoutConstraints API to be used and easily understood. It gives more context to the layouts. I understand that the view files can be fairly big but this is to separate responsibility as much as I can.

##### Kingfisher
I used Kingfisher for Image Caching. It's a great and performant library.

##### Alamofire
I used Alamofire for networking. It's the go-to library for networking and it's heavily tested and understood.

##### Object Mapper
I used ObjectMapper to transform JSON into Objects in Realm. It's an effective library that reduces code footprint dramatically.
