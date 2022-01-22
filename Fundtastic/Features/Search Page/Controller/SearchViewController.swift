//
//  SearchViewController.swift
//  Fundtastic
//
//  Created by Kendra Arsena W on 21/01/22.
//

import UIKit

class SearchViewController: UIViewController {

    // MARK: IBOutlet
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableViewSearch: UITableView!
    
    // MARK: Variable
    var newsSearch: NewsModel?
    var articles: [Article]?
    var selectedArticle: Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSearch.register(UINib(nibName: "\(SourcesReuseableTableViewCell.self)", bundle: nil), forCellReuseIdentifier: "cell_source")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toArticle" {
            let dest = segue.destination as? ArticleViewController
            dest?.selectedArticle = self.selectedArticle
        }
    }
}

// MARK: SEARCH BAR DELEGATE
extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        articles?.removeAll()
        
        if !searchText.isEmpty {
            newsSearch = NetworkHelper.shared.fetchNewsSearch(searchText: searchText)
            articles = newsSearch?.articles
        }
        
        tableViewSearch.reloadData()
    }
}

// MARK: TABLE VIEW DATA SOURCE & DELEGATE
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_source") as! SourcesReuseableTableViewCell
        
        if let imageurl = articles?[indexPath.row].urlToImage {
            let data = try? Data(contentsOf: URL(string: imageurl)!)
            cell.imageSource.image = UIImage(data: data!)
        }
        cell.labelTitle.text = articles?[indexPath.row].title
        cell.labelDescription.text = articles?[indexPath.row].description
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedArticle = articles?[indexPath.row]
        performSegue(withIdentifier: "toArticle", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
