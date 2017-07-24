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
		
		let x1: CGFloat = isSender ? 0.0 : 6.0
		let viewFrame = CGRect(x: x1, y: 0, width: rect.width - 6.0, height: rect.height)
		
		let cornerRadii = CGSize(width: rounding, height: rounding)
		let viewPath = UIBezierPath(roundedRect: viewFrame, byRoundingCorners: .allCorners, cornerRadii: cornerRadii)
		
		color.setStroke()
		color.setFill()
		viewPath.stroke()
		viewPath.fill()
		
		let context = UIGraphicsGetCurrentContext()
		
		context?.beginPath()
		
		let x2: CGFloat = isSender ? viewFrame.maxX : viewFrame.minX
		context?.move(to: CGPoint(x: x2, y: viewFrame.maxY - 16))
		
		let x3: CGFloat = isSender ? rect.maxX : 0.0
		let tangent1End = CGPoint(x: x3, y: rect.maxY)
		
		let x4: CGFloat = isSender ? 0.0 : viewFrame.maxX
		let tangent2End = CGPoint(x: x4, y: 0.0)
		
		context?.addArc(tangent1End: tangent1End, tangent2End: tangent2End, radius: 0.0)
		
		let x5: CGFloat = isSender ? viewFrame.maxX - 6.0 : viewFrame.minX + 6.0
		context?.addLine(to: CGPoint(x: x5, y: viewFrame.maxY - 6.0))
		
		context?.closePath()
		
		context?.setFillColor(color.cgColor)
		context?.fillPath()
		
	}
	
}

extension BubbleView {
	
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
