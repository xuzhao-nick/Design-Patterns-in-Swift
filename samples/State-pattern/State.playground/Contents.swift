import UIKit
import PlaygroundSupport

// MARK: - Context
public class TrafficLight: UIView {
    public private(set) var canisterLayers: [CAShapeLayer] = []
    public private(set) var currentState: TrafficLightState
    public private(set) var states: [TrafficLightState]
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError()
    }
    
    public var nextState: TrafficLightState {
        guard let index = states.firstIndex(where: { $0 === currentState}),
              index + 1 < states.count else {
            return states.first!
        }
        return states[index + 1]
    }
    
    public init(canisterCount: Int = 3,
                frame: CGRect = CGRect(x: 0, y: 0, width: 160, height: 420),
                states: [TrafficLightState]) {
        guard !states.isEmpty else {
            fatalError()
        }
        self.currentState = states.first!
        self.states = states
        super.init(frame: frame)
        backgroundColor = UIColor(red: 0.86, green: 0.64, blue: 0.25, alpha: 1)
        createCanisterLayers(count: canisterCount)
        transition(to: currentState)
    }
    
    public func createCanisterLayers(count: Int) {
        let paddingPercentage: CGFloat = 0.2
        let yTotalPadding = paddingPercentage * bounds.height
        let yPadding = yTotalPadding / CGFloat(count + 1)
        
        let canisterHeight = (bounds.height - yTotalPadding) / CGFloat(count)
        let xPadding = (bounds.width - canisterHeight) / 2.0
        var canisterFrame = CGRect(x: xPadding, y: yPadding, width: canisterHeight, height: canisterHeight)
        
        for _ in 0 ..< count {
            let canisterShape = CAShapeLayer()
            canisterShape.path = UIBezierPath(ovalIn: canisterFrame).cgPath
            canisterShape.fillColor = UIColor.black.cgColor
            layer.addSublayer(canisterShape)
            canisterLayers.append(canisterShape)
            canisterFrame.origin.y += (canisterFrame.height + yPadding)
        }
    }
    
    public func transition(to state: TrafficLightState) {
        removeCanisterSublayers()
        currentState = state
        currentState.apply(to: self)
        nextState.apply(to: self, after: currentState.delay)
    }
    
    private func removeCanisterSublayers() {
        canisterLayers.forEach{ $0.sublayers?.forEach { $0.removeFromSuperlayer() }}
    }
}

// MARK: - State Protocol
public protocol TrafficLightState: class {
    var delay: TimeInterval { get }
    
    func apply(to context: TrafficLight)
}

extension TrafficLightState {
    public func apply(to context: TrafficLight, after delay: TimeInterval) {
        let queue = DispatchQueue.main
        let dispatchTime = DispatchTime.now() + delay
        queue.asyncAfter(deadline: dispatchTime) { [weak self, weak context] in
            guard let self = self, let context = context else { return }
            context.transition(to: self)
        }
    }
}

// MARK: - Concrete States
public class SolidTrafficLightState {
    public let canisterIndex: Int
    public let color: UIColor
    public let delay: TimeInterval
    
    public init(canisterIndex: Int,
                color: UIColor,
                delay: TimeInterval) {
        self.canisterIndex = canisterIndex
        self.color = color
        self.delay = delay
    }
}

extension SolidTrafficLightState: TrafficLightState {
    public func apply(to context: TrafficLight) {
        let canisterLayer = context.canisterLayers[canisterIndex]
        let circleShape = CAShapeLayer()
        circleShape.path = canisterLayer.path!
        circleShape.fillColor = color.cgColor
        circleShape.strokeColor = color.cgColor
        canisterLayer.addSublayer(circleShape)
    }
}

extension SolidTrafficLightState {
    
    public class func greenLight(
        canisterIndex: Int = 2,
        color: UIColor = UIColor(red: 0.21, green: 0.78, blue: 0.35, alpha: 1.0),
        delay: TimeInterval = 1.0) -> SolidTrafficLightState {
        return SolidTrafficLightState(canisterIndex: canisterIndex, color: color, delay: delay)
    }
    
    public class func yellowLight(
        canisterIndex: Int = 1,
        color: UIColor = UIColor(red: 0.98, green: 0.91, blue: 0.07, alpha: 1.0),
        delay: TimeInterval = 1.0) -> SolidTrafficLightState {
        return SolidTrafficLightState(canisterIndex: canisterIndex, color: color, delay: delay)
    }
    
    public class func redLight(
        canisterIndex: Int = 0,
        color: UIColor = UIColor(red: 0.88, green: 0.0, blue: 0.04, alpha: 1.0),
        delay: TimeInterval = 1.0) -> SolidTrafficLightState {
        return SolidTrafficLightState(canisterIndex: canisterIndex, color: color, delay: delay)
    }
}

let greenYellowRed: [SolidTrafficLightState] = [.greenLight(), .yellowLight(), .redLight()]
PlaygroundPage.current.liveView = TrafficLight(states: greenYellowRed)
