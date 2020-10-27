import UIKit

public protocol MovieRatingStrategy {
    var ratingServiceName: String { get }
    
    func fetchRating(for movieTitle: String,
                     success: (_ rating: String, _ review: String) -> ())
}

public class RottenTomatoesClient: MovieRatingStrategy {
    public let ratingServiceName = "Rotten Tomatoes"
    
    public func fetchRating(for movieTitle: String, success: (_ rating: String, _ review: String) -> ()) {
        let rating = "95%"
        let review = "It rocked!"
        success(rating, review)
    }
}

public class IMDBClient: MovieRatingStrategy {
    public let ratingServiceName = "IMDB"
    
    public func fetchRating(for movieTitle: String, success: (_ rating: String, _ review: String) -> ()) {
        let rating = "3/10"
        let review = "It was terrible! The audience was throwing rotten tomatoes!"
        success(rating, review)
    }
}

public class MovieRatingViewController: UIViewController {
    // MARK: - Properties
    public var movieRatingClient: MovieRatingStrategy!
    
    // MARK: - Outlets
    @IBOutlet public var movieTitleTextField: UITextField!
    @IBOutlet public var ratingServiceNameLabel: UILabel!
    @IBOutlet public var ratingLabel: UILabel!
    @IBOutlet public var reviewLabel: UILabel!
    
    // MARK: - View Lifecycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        ratingServiceNameLabel.text = movieRatingClient.ratingServiceName
    }
    
    // MARK: - Actions
    @IBAction public func searchButtonPressed(_ sender: Any) {
        guard let movieTitle = movieTitleTextField.text, movieTitle.count > 0 else { return }
        movieRatingClient.fetchRating(for: movieTitle) {
            (rating, review) in
            self.ratingLabel.text = rating
            self.reviewLabel.text = review
        }
    }
    
}
