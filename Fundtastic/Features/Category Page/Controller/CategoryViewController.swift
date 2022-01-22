//
//  CategoryViewController.swift
//  Fundtastic
//
//  Created by Kendra Arsena W on 21/01/22.
//

import UIKit

class CategoryViewController: UIViewController {
    
    // MARK: Variable
    let categories = ["Business", "Entertainment", "General", "Health", "Science", "Sports", "Technology"]
    var selectedCategory: String?
    var allNews: NewsModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNewsSources" {
            let dest = segue.destination as? SourcesViewController
            dest?.selectedCategory = selectedCategory
            dest?.allNews = self.allNews
        }
    }
    
    func getNewsbySelectedCategory() {
        allNews = NetworkHelper.shared.fetchNewsSources(category: selectedCategory!.lowercased())
        
        if allNews?.status == "ok" {
            performSegue(withIdentifier: "toNewsSources", sender: self)
        } else if allNews?.status == "error" {
            let alert = UIAlertController.showOKAlert(title: "Error", message: allNews?.message ?? "")
            self.present(alert, animated: true, completion: nil)
        }
    }
}

// MARK: TABLE VIEW DATA SOURCE & DELEGATE 
extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_categories")
        
        cell?.textLabel?.text = categories[indexPath.row]
        cell?.textLabel?.font = UIFont.boldSystemFont(ofSize: 15.0)
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedCategory = categories[indexPath.row]
        self.getNewsbySelectedCategory()
    }
}
