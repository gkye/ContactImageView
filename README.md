[![codebeat badge](https://codebeat.co/badges/0307d76d-2646-4566-8e82-869b90c95f92)](https://codebeat.co/projects/github-com-gkye-contactimageview)
## ContactImageView
----------------------

UIImageView subclass which generates text as the placeholder for an ImageView, supports `IBDesignable` and code.

## Installation
### CocoaPods
```pod 'ContactImageView' ```

### Manual
Drag `ContactImageView.swift` file to your project

## Usage

### Storyboard / `IBDesignable`
![IBDesignable screenshot](http://g.recordit.co/vqI1yZmutI.gif)

### Programmatic / Code
Option  1
```swift
let imageView = ContactImageView(frame: CGRect(x:10, y: 50, width: 100, height: 100))
imageView.setImageText(text: "George Kye", backgroundImage: UIImage(named: "bg"), username: true, textColor: UIColor.whiteColor(), fillColor: UIColor.blackColor(), circle: true) //backgroundImage is optional
```
Option 2
```swift
    let imageView2 = ContactImageView(frame: CGRect(x:130, y: 50, width: 100, height: 100))
    imageView2.text = "Joe Swanson" //Default = "GK"
    imageView2.username = true //Default = false (Returns initials of username if true)
    imageView2.textColor = UIColor.purpleColor() //Default = UIColor.whiteColor()
    imageView2.circle = false //Default = true
    imageView2.textFont = UIFont.italicSystemFontOfSize(30) //Default = UIFont.systemFontOfSize(22)
    imageView2.fontSize = 11 //Default = 22
    imageView2.fillColor = UIColor.greenColor() //Default = UIColor.lightGrayColor
```
## Author
<a href="twitter.com/gkye">George Kye </a>

## License
ContactImageView is available under the MIT license. See the LICENSE file for more info.
