//
//  SourcesViewController.swift
//  Fundtastic
//
//  Created by Kendra Arsena W on 21/01/22.
//

import UIKit

class SourcesViewController: UIViewController {

    // MARK: IBOutlet
    @IBOutlet weak var tableViewSources: UITableView!
    
    // MARK: Variable
    var selectedCategory: String?
    var allNews: NewsModel?
    var articles = [Article]()
    var selectedArticle: Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = selectedCategory
        articles = allNews?.articles ?? []
        tableViewSources.register(UINib(nibName: "\(SourcesReuseableTableViewCell.self)", bundle: nil), forCellReuseIdentifier: "cell_source")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toArticle" {
            let dest = segue.destination as? ArticleViewController
            dest?.selectedArticle = self.selectedArticle
        }
    }
}

// MARK: TABLE VIEW DATA SOURCE & DELEGATE
extension SourcesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_source") as! SourcesReuseableTableViewCell
        
        if let imageurl = articles[indexPath.row].urlToImage {
            let data = try? Data(contentsOf: URL(string: imageurl)!)
            cell.imageSource.image = UIImage(data: data!)
        }
        cell.labelTitle.text = articles[indexPath.row].title
        cell.labelDescription.text = articles[indexPath.row].description
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedArticle = articles[indexPath.row]
        performSegue(withIdentifier: "toArticle", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
