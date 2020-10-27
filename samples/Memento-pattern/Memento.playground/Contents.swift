import Foundation

// MARK: - Originator
public class Game: Codable {
    public class State: Codable {
        public var attemptsRemaining = 3
        public var level = 1
        public var score = 0
    }
    
    public var state = State()
    
    public func rackUpMassivePoints() {
        state.score += 9002
    }
    
    public func monstersEatPlayer() {
        state.attemptsRemaining -= 1
    }

}

// MARK: - Memento
typealias GameMemento = Data

// MARK: - CareTaker
public class GameSystem {
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    private let userDefaults = UserDefaults.standard
    
    public func save(_ game: Game, title: String) throws {
        let data = try encoder.encode(game)
        userDefaults.set(data, forKey: title)
    }
    
    public func load(title: String) throws -> Game {
        guard let data = userDefaults.data(forKey: title),
              let game = try? decoder.decode(Game.self, from: data) else {
            throw Error.gameNotFound
        }
        return game
    }
    
    public enum Error: String, Swift.Error {
        case gameNotFound
    }
}

// MARK: - Example
var game = Game()
game.monstersEatPlayer()
game.rackUpMassivePoints()

// Save Game
let gameSystem = GameSystem()
try gameSystem.save(game, title: "Best Game Ever")

// New Game
game = Game()
print("New Game Score: \(game.state.score)")

// Load Game
game = try! gameSystem.load(title: "Best Game Ever")
print("Loaded Game Score: \(game.state.score)")

