//
//  ViewController.swift
//  YSTreeTableView
//
//  Created by yaoshuai on 2017/1/10.
//  Copyright © 2017年 ys. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let beiJing = YSTreeTableViewNode(nodeID: 1, nodeName: "北京", leftImageName: "", rightImageName: "", isExpand: true)!
        
        let haiDian = YSTreeTableViewNode(nodeID: 11, nodeName: "海淀", leftImageName: "", rightImageName: "", isExpand: false)!
        
        let shangDi = YSTreeTableViewNode(nodeID: 111, nodeName: "上地", leftImageName: "", rightImageName: "", isExpand: true)!
        let shangDiWu = YSTreeTableViewNode(nodeID: 111, nodeName: "上地五街", leftImageName: "", rightImageName: "", isExpand: false)!
        let shangdiQi = YSTreeTableViewNode(nodeID: 111, nodeName: "上地七街", leftImageName: "", rightImageName: "", isExpand: false)!
        
        let wuDaoKou = YSTreeTableViewNode(nodeID: 112, nodeName: "五道口", leftImageName: "", rightImageName: "", isExpand: false)!
        
        let heNan = YSTreeTableViewNode(nodeID: 2, nodeName: "河南", leftImageName: "", rightImageName: "", isExpand: false)!
        
        let zhengZhou = YSTreeTableViewNode(nodeID: 21, nodeName: "郑州", leftImageName: "", rightImageName: "", isExpand: false)!
        let zhuMaDian = YSTreeTableViewNode(nodeID: 22, nodeName: "驻马店", leftImageName: "", rightImageName: "", isExpand: false)!
        
        let xiPing = YSTreeTableViewNode(nodeID: 221, nodeName: "西平县", leftImageName: "", rightImageName: "", isExpand: false)!
        
        let rootNodes = [beiJing,heNan] // 指定根节点
        beiJing.addChildNode(childNode: haiDian) // 通过方法 addChildNode 指定父子关系
        haiDian.subNodes = [shangDi,wuDaoKou] // 通过属性 subNodes 指定父子关系
        shangDiWu.parentNode = shangDi // 通过属性 parentNode 指定父子关系
        shangdiQi.parentNode = shangDi
        
        heNan.subNodes = [zhengZhou,zhuMaDian]
        zhuMaDian.addChildNode(childNode: xiPing)
        
        
        let treeTableView = YSTreeTableView(frame: view.bounds, style: .plain)
        treeTableView.rootNodes = rootNodes
        treeTableView.treeDelegate = self
        view.addSubview(treeTableView)
    }
}
extension ViewController:YSTreeTableViewDelegate{
    func treeCellClick(node: YSTreeTableViewNode, indexPath: IndexPath) {
        print("indexPath is \(indexPath)")
        print("currentNodeModel is \(node)")
        print("currentNodeModelName is \(node.nodeName)")
        if node.isExpand{ // 当前为展开状态，要进行收缩操作
            print("进行了收缩操作")
        } else{
            print("进行了展开操作")
        }
    }
}
