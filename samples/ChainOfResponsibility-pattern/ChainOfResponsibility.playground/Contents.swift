import Foundation

/*
 Following code is to simulate a VendingMachine which accept coins.
 The VendingMachine itself is the client and accept coin input events.
 The handler protocol require a handlCoinValidation(_:) method and a next property.
 The concrete handlers are coin validators. They determine whether an unknown coin was valid based on certain criteria, such as a coin's weight and diameter, and use this to create a known coin type, such as a Penny.
*/

// MARK: - Modules
public class Coin {
    public class var standardDiameter: Double {
        return 0
    }
    public class var standardWeight: Double {
        return 0
    }
    
    public var centValue: Int { return 0 }
    public final var dollarValue: Double {
        return Double(centValue) / 10
    }
    
    public final let diameter: Double
    public final let weight: Double

    public required init(diameter: Double, weight: Double) {
        self.diameter = diameter
        self.weight = weight
    }
    
    public convenience init() {
        let diameter = type(of: self).standardDiameter
        let weight = type(of: self).standardWeight
        self.init(diameter: diameter, weight: weight)
    }
}

extension Coin: CustomStringConvertible {
    public var description: String {
        return String(format: "%@ {diameter: %0.3f, dollarValue: $%0.2f, weight: %0.3f}",
                      "\(type(of: self))", diameter, dollarValue, weight)
    }
}

public class Penny: Coin {
    public override class var standardDiameter: Double {
        return 19.05
    }
    public override class var standardWeight: Double {
        return 2.5
    }
    public override var centValue: Int {
        return 1
    }
}

public class Nickel: Coin {
    public override class var standardDiameter: Double {
        return 21.21
    }
    public override class var standardWeight: Double {
        return 5.0
    }
    public override var centValue: Int {
        return 5
    }
}

public class Dime: Coin {
    public override class var standardDiameter: Double {
        return 17.91
    }
    public override class var standardWeight: Double {
        return 2.268
    }
    public override var centValue: Int {
        return 10
    }
}

public class Quarter: Coin {
    public override class var standardDiameter: Double {
        return 24.26
    }
    public override class var standardWeight: Double {
        return 5.670
    }
    public override var centValue: Int {
        return 25
    }
}

// MARK: - HandlerProtocol
public protocol CoinHandlerProtocol {
    var next: CoinHandlerProtocol? { get }
    func handleCoinValidation(_ unknownCoin: (Coin)) -> Coin?
}

// MARK: - Concrete Handler
public class CoinHandler {
    public var next: CoinHandlerProtocol?
    public let coinType: Coin.Type
    public let diameterRange: ClosedRange<Double>
    public let weightRange: ClosedRange<Double>
    
    public init(coinType: Coin.Type,
                diameterVariation: Double = 0.05,
                weightVariation: Double = 0.05) {
        self.coinType = coinType
        
        let standardDiameter = coinType.standardDiameter
        self.diameterRange = (1 - diameterVariation) * standardDiameter ... (1 + diameterVariation) * standardDiameter
        
        let standardWeight = coinType.standardWeight
        self.weightRange = (1 - weightVariation) * standardWeight ... (1 + weightVariation) * standardWeight
    }
}

extension CoinHandler: CoinHandlerProtocol {
    
    public func handleCoinValidation(_ unknownCoin: (Coin)) -> Coin? {
        guard let coin = createCoin(from: unknownCoin) else {
            return next?.handleCoinValidation(unknownCoin)
        }
        return coin
    }
    
    private func createCoin(from unknowCoin: Coin) -> Coin? {
        print("Attempt to create \(coinType)")
        guard diameterRange.contains(unknowCoin.diameter) else {
            print("Invalid diameter")
            return nil
        }
        guard weightRange.contains(unknowCoin.weight) else {
            print("Invalid weight")
            return nil
        }
        let coin = coinType.init(diameter: unknowCoin.diameter, weight: unknowCoin.weight)
        print("Created \(coin)")
        return coin
        
    }
    
}


public class VendingMachine {
    public let coinHandler: CoinHandler
    public var coins: [Coin] = []
    
    public init(coinHandler: CoinHandler) {
        self.coinHandler = coinHandler
    }
    
    public func insertCoin(_ unknownCoin: Coin) {
        guard let coin = coinHandler.handleCoinValidation(unknownCoin) else {
            print("Coin rejected: \(unknownCoin)")
            return
        }
        print("Coin Accepted: \(coin)")
        coins.append(coin)
        
        let dollarValue = coins.reduce(0, { $0 + $1.dollarValue })
        print("")
        print("Coins Total Value: $\(dollarValue)")
        
        let weight = coins.reduce(0, { $0 + $1.weight })
        print("Coins Total Weight: \(weight) g")
        print("")
        
    }
}

// MARK: - Example
let pennyHandler = CoinHandler(coinType: Penny.self)
let nickleHandler = CoinHandler(coinType: Nickel.self)
let dimeHandler = CoinHandler(coinType: Dime.self)
let quarterHandler = CoinHandler(coinType: Quarter.self)

pennyHandler.next = nickleHandler
nickleHandler.next = dimeHandler
dimeHandler.next = quarterHandler

let vendingMachine = VendingMachine(coinHandler: pennyHandler)

let penny = Penny()
vendingMachine.insertCoin(penny)

let quarter = Coin(diameter: Quarter.standardDiameter, weight: Quarter.standardWeight)
vendingMachine.insertCoin(quarter)


let invalidDime = Coin(diameter: Quarter.standardDiameter, weight: Dime.standardWeight)
vendingMachine.insertCoin(invalidDime)

