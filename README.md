# FooyoTestSDK

Fooyo SDK for OSP

# Installation

## Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate SnapKit into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "Pushian/FooyoTestSDK"
```

Run `carthage update` to build the framework and drag the following built 
`Alamofire.framework`
`AlamofireImage.framework`
`Mapbox.framework`
`SwiftyJSON.framework`
`SVProgressHUD.framework`
`SnapKit.framework`
`TGPControls.framework`
`FooyoTestSDK.framework`
as well as the bundle file `FooyoSDK.bundle` inside `FooyoTestSDK.framework`
into your Xcode project.

# Usage

```swift
import FooyoTestSDK
```

## SDK Demo Project

[A Demo Project](https://github.com/fooyo/FooyoSDKDemo/tree/master) is created specically for the OSP project to demostrate how to integrate Fooyo's SDK.

## General SDK Parameters

```swift
public class FooyoIndex: NSObject {
    var category: String?
    var levelOneId: Int?
    var levelTwoId: Int?
}
```
`FooyoIndex` is designed for an easy communication between the base system and the SDK functions, which incldues the following parameters:

- `category`: Category Name (`String Value`);
- `levelOneId`: The id for all the locations and trails (`Int Value`);
- `levelTwoId`: The hotspot id for all the `Hotspots` of `Non-linear Trails` (`Int Value`)

Only `Hotspots` of `Non-linear Trails` will have `levelTwoId`. Their `levelOneId` is the `Non-linear Trail` Id.

## BaseMap SDK

### Initialization

```swift
let vc = FooyoBaseMapViewController(index: FooyoIndex?)
vc.delegate = self
```

### SDK Variables

For this function, the index would only inclue `categroy` and `levelOneId` but both of the them are **optional**:

- To show all the locations belong to a specific category, please specify the category name only：

```swift
let index = FooyoIndex(category: String)
let vc = FooyoBaseMapViewController(index: FooyoIndex?)
```

- To show a specific location, please specify the category name and the id of this location/trail:

```swift
let index = FooyoIndex(category: String, levelOneId: Int)
let vc = FooyoBaseMapViewController(index: FooyoIndex?)
```

- To show all the locations, please do not sepcify the index:

```swift
let vc = FooyoBaseMapViewController()
```

### Delegate Function

Delegate Prototal: `FooyoBaseMapViewControllerDelegate`.

Delegate Function:

```swift
func fooyoBaseMapViewController(didSelectInformationWindow index: FooyoIndex) {
        debugPrint(index.category)
        debugPrint(index.levelOneId)
        debugPrint(index.levelTwoId)
}
```

This function will be called when the information window is clicked.

## Navigation SDK

### Initialization

```swift
let vc = FooyoNavigationViewController(startIndex: FooyoIndex?, endIndex: FooyoIndex)
```

### SDK Variables

- `startIndex`: category name of the start location (**optional**);

- `endIndex`: category name of the end location (**compulsory**);


When the `startIndex` is unspecified, the user's current location will be considered as the starting point.


## My Plans SDK

### Initialization

```swift
let vc = FooyoBaseMapViewController()
```

## Add To Plan SDK

### Initialization

```swift
let vc = FooyoAddToPlanViewController(index: FooyoIndex)
```

### SDK Variables

- `index`: index of the location/trail intended to add to a specific plan (**compulsory**);

