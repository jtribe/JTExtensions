
/*
 * Jtribe
 * UIColorExtension
 *
 * Description:
 * Extensions to make dealing with instances of UIColor more simple, intuative and powerful.
 *
 * Jtribe Copyright © 2016
 */

import UIKit

extension UIColor {
	
	// MARK: Lightening & Darkening
	
	// Description:
	// This extension provides methods to lighten and darken a UIColor.
	
	func lightenColour() -> UIColor {
		return lightenColourByPercentage(0.2)
	}
	
	func darkenColour() -> UIColor {
		return darkenColourByPercentage(0.2)
	}
	
    func lightenColourByPercentage(percentage: CGFloat) -> UIColor {
		
		// extract colour components
		var oldRed: CGFloat = 0, oldGreen: CGFloat = 0, oldBlue: CGFloat = 0, oldAlpha: CGFloat = 0
        getRed(&oldRed, green: &oldGreen, blue: &oldBlue, alpha: &oldAlpha)
		
		// form new colour components
		let red = oldRed + (percentage * (1-oldRed))
		let green = oldGreen + (percentage * (1-oldGreen))
		let blue = oldBlue + (percentage * (1-oldBlue))
        return UIColor(red: red, green: green, blue: blue, alpha: oldAlpha)
    }
    
    func darkenColourByPercentage(factor: CGFloat) -> UIColor {
		
		// extract colour components
		var oldRed: CGFloat = 0, oldGreen: CGFloat = 0, oldBlue: CGFloat = 0, oldAlpha: CGFloat = 0
		getRed(&oldRed, green: &oldGreen, blue: &oldBlue, alpha: &oldAlpha)

		// form new colour components
		let red = oldRed - (factor * oldRed)
		let green = oldGreen - (factor * oldGreen)
		let blue = oldBlue - (factor * oldBlue)
		return UIColor(red: red, green: green, blue: blue, alpha: oldAlpha)
    }
	
	// MARK: Colour Image
	
	// Description:
	// This extension enables you to get an image from a UIColor.
	
    func colourAsImage() -> UIImage {
        UIGraphicsBeginImageContext(CGSizeMake(1,1))
        let context: CGContextRef = UIGraphicsGetCurrentContext()!
        CGContextSetFillColorWithColor(context, self.CGColor)
        CGContextFillRect(context, CGRectMake(0.0, 0.0, 1.0, 1.0))
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        return image;
    }
}
