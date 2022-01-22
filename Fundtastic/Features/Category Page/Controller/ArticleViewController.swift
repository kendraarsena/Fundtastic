//
//  ArticleViewController.swift
//  Fundtastic
//
//  Created by Kendra Arsena W on 21/01/22.
//

import UIKit

class ArticleViewController: UIViewController {

    // MARK: IBOutlet
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleAuthor: UILabel!
    @IBOutlet weak var articlePublisedDate: UILabel!
    @IBOutlet weak var articleContent: UILabel!
    
    // MARK: Variable
    var selectedArticle: Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI() {
        if let selectedArticle = selectedArticle {
            if let imageurl = selectedArticle.urlToImage {
                let data = try? Data(contentsOf: URL(string: imageurl)!)
                articleImage.image = UIImage(data: data!)
            }
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
            let publishedDate = dateFormatter.date(from: selectedArticle.publishedAt!)
            
            articleAuthor.text = "Author: \(selectedArticle.author ?? "-")"
            articlePublisedDate.text = publishedDate?.formatted(date: .long, time: .omitted) ?? "-"
            articleTitle.text = selectedArticle.title
            articleContent.text = selectedArticle.content
        }
        
    }
    
    @IBAction func goToWebsite(_ sender: Any) {
        if let url = URL(string: selectedArticle?.url ?? "") {
            UIApplication.shared.open(url)
        }
    }
}
