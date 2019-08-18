//
//  ArticleDetailViewController.swift
//  NYTimesAPIDemo
//
//  Created by Abdul Sami on 18/08/2019.
//  Copyright © 2019 Abdul Sami. All rights reserved.
//

import UIKit
import SafariServices

class ArticleDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var articleImageView: CustomImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var publishedDateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var openUrlButton: UIButton!
    
    var viewModel: ArticleDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    func setUpView() {
        articleImageView.layer.cornerRadius = articleImageView.frame.height/2;
        openUrlButton.layer.cornerRadius = 8.0
        titleLabel.text = viewModel.getTitle()
        articleImageView.loadImageUsingUrlString(viewModel.getArticleImageURL())
        authorLabel.text = viewModel.getArticleAuthor()
        publishedDateLabel.text = viewModel.getArticleDate()
        descriptionLabel.text = viewModel.getArticleDescription()
        sourceLabel.text = "Source: " + viewModel.getArticleSource()
    }
    
    
    @IBAction func openURLPressed(_ sender: Any) {
        if let url = URL(string: viewModel.getArticleWebUrl()) {
            let vc = SFSafariViewController(url: url)
            present(vc, animated: true, completion: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
