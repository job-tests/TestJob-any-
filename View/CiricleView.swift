import UIKit
import Foundation


class TimerCircularBarView: UIView {
    
    private let shapeView = UIView()
    
    private let shapeLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.lineWidth = 0
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = UIColor.clear.cgColor
        return layer
    }()
    
    private let inProgressLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.lineWidth = 7
        layer.strokeColor = UIColor.white.cgColor
        layer.lineCap = .round
        layer.fillColor = UIColor(named: "s")?.cgColor
        return layer
    }()
    
    private let progressLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.lineWidth = 30
        layer.fillColor = UIColor(named: "n")?.cgColor
        layer.lineCap = .round
        layer.strokeColor = UIColor(named: "n")?.cgColor
        return layer
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 35)
        label.text = "00:00:59"
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    func setupView() {
        [shapeView,
         timeLabel].forEach {
            addSubview($0)
        }
        setupConstrains()
    }
    
    func setupConstrains() {
        let constraint = [
                          shapeView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                          shapeView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                          timeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                          timeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ]

        NSLayoutConstraint.activate(constraint)
    }
    
    func setupLayers() {
        shapeLayer.cornerRadius = frame.width / 2

        let diameter = min(bounds.width, bounds.height)
        let arcCenter = CGPoint(x: bounds.midX, y: bounds.midY)

        shapeLayer.path = UIBezierPath      (arcCenter: arcCenter,
                                             radius: diameter / 2,
                                             startAngle: 0,
                                             endAngle: .pi * 2,
                                             clockwise: true).cgPath

        progressLayer.path = UIBezierPath    (arcCenter: arcCenter,
                                              radius: diameter / 2,
                                              startAngle: -.pi / 2,
                                              endAngle: .pi * 1.5,
                                              clockwise: true).cgPath
        
        inProgressLayer.path = UIBezierPath  (arcCenter: arcCenter,
                                              radius: diameter / 2.5,
                                              startAngle: -.pi / 2,
                                              endAngle: .pi * 1.5,
                                              clockwise: true).cgPath

        shapeView.layer.addSublayer(shapeLayer)
        shapeView.layer.insertSublayer(progressLayer, above: shapeLayer)
        shapeView.layer.insertSublayer(inProgressLayer, above: progressLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayers()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




