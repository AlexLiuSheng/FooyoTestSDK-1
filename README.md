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

## BaseMap SDK

### Initialization

```swift
let vc = FooyoBaseMapViewController(category: String?, levelOneId: Int?)
vc.delegate = self
```
Both of the two variables `category` and `levelOneId` are optional. 

- To show all the locations belong to a specific category, please specify the category name only;
- To show a specific location, please specify the category name and the id of this location;
- To show all the locations, please do not sepcify any of them.

### Delegate Functions
## Call Back Functions

```swift
extension MyViewController: FRPhotoCollageCreateDelegate {
    func didTapCancel() {
        debugPrint("PhotoCollage is dismissed.")
    }
    
    func didTapDone() {
        debugPrint("PhotoCollage is completed.")
    }
    
}
```

