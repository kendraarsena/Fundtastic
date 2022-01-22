//
//  SourcesReuseableTableViewCell.swift
//  Fundtastic
//
//  Created by Kendra Arsena W on 22/01/22.
//

import UIKit

class SourcesReuseableTableViewCell: UITableViewCell {

    @IBOutlet weak var imageSource: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
