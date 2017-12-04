
import Foundation
import UIKit
@IBDesignable

class DashlineDraw : UIView {
    
    override func draw(_ rect: CGRect) {
        
        let path = UIBezierPath()
        
        let radius: Double = Double(rect.width) / 2 - 20
        
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let percentage = 100.0
        let startingPoint = 0.0
        let endingPoint = 361.0 * percentage / 100 + startingPoint
        
        path.move(to: CGPoint(x: center.x - CGFloat(radius), y: center.y))
        
        let elementSpacing = 2.5
        for j in stride(from: startingPoint, to: endingPoint, by: elementSpacing)
        {
            let rad = (j+180.0) * Double.pi / 180.0
            let x1 = Double(center.x) + radius * cos(rad)
            let y1 = Double(center.y) + radius * sin(rad)
            path.move(to: CGPoint(x: x1, y: y1))
            
            if(startingPoint == j)
            {
                for i in stride(from: j+178.0, to: j+182.0, by: 1) {
                    let radians = i * Double.pi / 180.0
                    let x =  Double(center.x) + radius * cos(radians)
                    let y = Double(center.y) + radius * sin(radians)
                    path.addLine(to: CGPoint(x: x, y: y))
                }
                UIColor.blue.setStroke()
                path.lineWidth = 18
                path.stroke()
            }
            else{
                for i in stride(from: j+180.0, to: j+182.0, by: 1) {
                    let radians = i * Double.pi / 180
                    let x =  Double(center.x) + radius * cos(radians)
                    let y = Double(center.y) + radius * sin(radians)
                    path.addLine(to: CGPoint(x: x, y: y))
                }
                UIColor.blue.setStroke()
                path.lineWidth = 10
                path.stroke()
                
            }
            path.move(to: CGPoint(x: center.x + CGFloat(radius), y: center.y))
        }
        var displacement = 40.0
        
        let num = NSAttributedString(string:"\(Int(percentage))", attributes: [ NSAttributedStringKey.foregroundColor:                             UIColor.white, NSAttributedStringKey.font: UIFont.systemFont(ofSize: 70.0)])
        if(percentage >= 10 && percentage < 100)
            {
                displacement = 40.0}
        if(percentage < 10)
        {
            displacement = 30.0}
        if(percentage == 100.0)
        {
            displacement = 47.0}
        let w = Double(rect.width / 2) - displacement
        let h = Double(rect.height / 2) - displacement
        num.draw(at: CGPoint(x: w, y: h))

    }
    
}
