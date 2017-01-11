//
//  YSTreeTableViewContentCell.swift
//  YSTreeTableView
//
//  Created by yaoshuai on 2017/1/10.
//  Copyright © 2017年 ys. All rights reserved.
//

import UIKit

/// 内容Cell-最底层Cell
class YSTreeTableViewContentCell: UITableViewCell {

    var node:YSTreeTableViewNode?{
        didSet{
            indentationLevel = node?.depth ?? 0 // 缩进层次
            indentationWidth = 30 // 每次缩进宽度
            
            textLabel?.text = node?.nodeName
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
