//
//  YSTreeTableViewNode.swift
//  YSTreeTableView
//
//  Created by yaoshuai on 2017/1/10.
//  Copyright © 2017年 ys. All rights reserved.
//

import UIKit

/// 节点类型
class YSTreeTableViewNode: NSObject {
    
    /// 父节点 - nil表示根节点
    var parentNode:YSTreeTableViewNode?{
        didSet{
            if let parentN = parentNode, !parentN.subNodes.contains(self) {
                parentN.subNodes.append(self)
            }
        }
    }
    
    /// 子节点集合
    var subNodes:[YSTreeTableViewNode] = [YSTreeTableViewNode](){
        didSet{
            for childNode in subNodes{
                childNode.parentNode = self
            }
        }
    }
    
    /// 本节点ID
    var nodeID:UInt = 0
    
    /// 本节点名称
    var nodeName:String = ""
    
    /// 左侧图标
    var leftImageName:String = ""
    
    /// 右侧图标
    var rightImageName:String = ""
    
    /// 本节点是否处于展开状态
    var isExpand:Bool = false
    
    /// 深度：根节点为0
    var depth:Int{
        if let parentN = parentNode{
            return parentN.depth + 1
        }
        return 0
    }
    
    /// 私有化构造函数
    private override init(){
        super.init()
    }
    
    /// 便利构造函数
    ///
    /// - Parameters:
    ///   - parentNodeID: 父节点ID(>=-1，-1表示根节点)
    ///   - nodeID: 本节点ID(>=0)
    ///   - nodeName: 本节点名称(!="")
    ///   - leftImageName: 左侧图标
    ///   - rightImageName: 右侧图标
    ///   - isExpand: 本节点是否处于展开状态
    convenience init?(nodeID:UInt,nodeName:String,leftImageName:String,rightImageName:String,isExpand:Bool){
        
        self.init()
        
        if nodeName == ""{
            return nil
        }
        else{
            self.nodeID = nodeID
            self.nodeName = nodeName
            self.leftImageName = leftImageName
            self.rightImageName = rightImageName
            self.isExpand = isExpand
        }
    }
    
    /// 添加子节点
    ///
    /// - Parameter childNode: 子节点
    func addChildNode(childNode:YSTreeTableViewNode){
        childNode.parentNode = self
    }
}
