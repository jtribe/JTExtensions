
/*
* JTExtensions
* UIView
*
* Description:
* Extensions to make working with UIViews, as well as UIView subclasses
* more simple, intuative and powerful.
*
* Jtribe Copyright © 2016
*/

import UIKit

// MARK: Positioning & Sizing

// Description:
// This extension provides quicker and easier access to the position and
// size values relating to a UIView

extension UIView {
	
	var x: CGFloat {
		get{ return self.frame.origin.x }
		set(newValue){ self.frame.origin.x = newValue }
	}
	
	var y: CGFloat {
		get{ return self.frame.origin.y }
		set(newValue){ self.frame.origin.y = newValue }
	}
	
	var width: CGFloat {
		get{ return self.frame.size.width}
		set(newValue){self.frame.size.width = newValue }
	}
	
	var height: CGFloat {
		get{ return self.frame.size.height }
		set(newValue){ self.frame.size.height = newValue }
	}
	
	var origin: CGPoint {
		get{ return self.frame.origin }
		set(newValue){ self.frame.origin = newValue }
	}
	
	var size: CGSize {
		get{ return self.frame.size }
		set(newValue){ self.frame.size = newValue }
	}
    
    // rounding the corners of the view's layer.
    func roundCorners(radius: CGFloat = CGFloat(10)) {
        layer.cornerRadius = radius
    }
	
}
