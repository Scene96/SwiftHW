
import Foundation

import UIKit
@IBDesignable
class CircleView: UIView {
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        
        let radius: Double = Double(rect.width) / 2 - 20
        
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        
        path.move(to: CGPoint(x: center.x + CGFloat(radius), y: center.y))
        
        for i in stride(from: 0, to: 361.0, by: 1) {
            let radians = i * Double.pi / 180
            let x = Double(center.x) + radius * cos(radians)
            let y = Double(center.y) + radius * sin(radians)
            path.addLine(to: CGPoint(x: x, y: y))
        }
        
        UIColor.gray.setStroke()
        path.lineWidth = 15
        path.stroke()
    }
    
}
