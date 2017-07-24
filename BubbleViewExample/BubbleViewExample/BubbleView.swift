//
//  BubbleView.swift
//  MessageView
//
//  Created by Omar Albeik on 7/24/17.
//  Copyright © 2017 Omar Albeik. All rights reserved.
//

import UIKit

@IBDesignable
class BubbleView: UIView {
	
	@IBInspectable
	var isSender: Bool = true
	
	init(frame: CGRect, isSender: Bool) {
		self.isSender = isSender
		super.init(frame: frame)
		setupView()
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupView()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setupView()
	}
	
	override func draw(_ rect: CGRect) {
		
		let color = isSender ? senderColor : receiverColor
		
		let rounding: CGFloat = 20.0
		
		let x1: CGFloat = isSender ? 0.0 : 5.0
		let viewFrame = CGRect(x: x1, y: 0, width: rect.width - 5.0, height: rect.height)
		
		let cornerRadii = CGSize(width: rounding, height: rounding)
		let viewPath = UIBezierPath(roundedRect: viewFrame, byRoundingCorners: .allCorners, cornerRadii: cornerRadii)
		
		color.setStroke()
		color.setFill()
		viewPath.stroke()
		viewPath.fill()
		
		var tailPath: UIBezierPath {
			if isSender {
				let point = CGPoint(x: rect.maxX - 17.0, y: rect.maxY - 18.0)
				return senderTailPath(from: point)
			} else {
				let point = CGPoint(x: rect.minX, y: rect.maxY - 18.0)
				return receiverTailPath(from: point)
			}
		}
		
		color.setFill()
		tailPath.fill()
		
	}
	
}


fileprivate extension BubbleView {
	
	func senderTailPath(from point: CGPoint) -> UIBezierPath {
		let path = UIBezierPath()
		path.move(to: CGPoint(x: point.x + 12.0, y: point.y))
		path.addCurve(to: CGPoint(x: point.x + 13.0, y: point.y + 12.0),
		              controlPoint1: CGPoint(x: point.x + 12.0, y: point.y + 6.0),
		              controlPoint2: CGPoint(x: point.x + 12.0, y: point.y + 10.0))
		
		path.addCurve(to: CGPoint(x: point.x + 17.0, y: point.y + 17.0),
		              controlPoint1: CGPoint(x: point.x + 14.0, y: point.y + 14.0),
		              controlPoint2: CGPoint(x: point.x + 15.0, y: point.y + 16.0))
		
		path.addCurve(to: CGPoint(x: point.x + 12.0, y: point.y + 16.2),
		              controlPoint1: CGPoint(x: point.x + 15.0, y: point.y + 17.0),
		              controlPoint2: CGPoint(x: point.x + 14.0, y: point.y + 17.0))
		
		path.addCurve(to: CGPoint(x: point.x, y: point.y + 12.0),
		              controlPoint1: CGPoint(x: point.x + 10.0, y: point.y + 16.0),
		              controlPoint2: CGPoint(x: point.x + 6.0, y: point.y + 14.0))
		
		path.addLine(to: CGPoint(x: point.x, y: point.y))
		path.addLine(to: CGPoint(x: point.x + 12.0, y: point.y))
		path.close()
		path.usesEvenOddFillRule = true
		
		return path
	}
	
	func receiverTailPath(from point: CGPoint) -> UIBezierPath {
	
		let path = UIBezierPath()
		path.move(to: CGPoint(x: point.x + 5.0, y: point.y))
		path.addCurve(to: CGPoint(x: point.x + 4.0, y: point.y + 12.0),
		              controlPoint1: CGPoint(x: point.x + 5.0, y: point.y + 6.0),
		              controlPoint2: CGPoint(x: point.x + 5.0, y: point.y + 10.0))
		
		path.addCurve(to: CGPoint(x: point.x, y: point.y + 17.0),
		              controlPoint1: CGPoint(x: point.x + 3.0, y: point.y + 14.0),
		              controlPoint2: CGPoint(x: point.x + 2.0, y: point.y + 16.0))
		
		path.addCurve(to: CGPoint(x: point.x + 5.0, y: point.y + 16.0),
		              controlPoint1: CGPoint(x: point.x + 2.0, y: point.y + 17.0),
		              controlPoint2: CGPoint(x: point.x + 3.0, y: point.y + 17.0))
		
		path.addCurve(to: CGPoint(x: point.x + 17.0, y: point.y + 11.77),
		              controlPoint1: CGPoint(x: point.x + 7.0, y: point.y + 16.0),
		              controlPoint2: CGPoint(x: point.x + 11.0, y: point.y + 14.0))
		
		path.addLine(to: CGPoint(x: point.x + 17.0, y: point.y))
		path.addLine(to: CGPoint(x: point.x + 5.0, y: point.y))
		path.close()
		path.usesEvenOddFillRule = true
		
		return path
	}
	
	func setupView() {
		contentMode = .redraw
	}
	
	var senderColor: UIColor {
		return .gray
	}
	
	var receiverColor: UIColor {
		return .green
	}
	
}
