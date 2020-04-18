

import UIKit

class TableViewCell: UITableViewCell
{

    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var summaryLabel: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        self.configureUIObjects()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        
    }
    
    func configureUIObjects()
    {
        self.titleLabel.textColor = UIColor.green
        self.titleLabel.textAlignment = NSTextAlignment.left
        self.titleLabel.numberOfLines = 0
        
        
        self.summaryLabel.textAlignment = NSTextAlignment.left
        self.summaryLabel.numberOfLines = 2
        
        
        
        
    }

}
