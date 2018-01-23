//
//  SuperViewController.swift
//  NSAttributedString
//
//  Created by frank.Zhang on 19/01/2018.
//  Copyright © 2018 Frank.Zhang. All rights reserved.
//

import UIKit

class SuperViewController: UIViewController {
let titleStr: String = "单车欲问边，属国过居延。征蓬出汉塞，归雁入胡天。大漠孤烟直，长河落日圆。萧关逢候骑，都护在燕然。"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func hildTableViewExtraCellLineHidden(tableView : UITableView){
        let view = UIView()
        view.backgroundColor = UIColor.clear
        tableView.tableFooterView = view
        tableView.tableHeaderView = view
    }
    
     func addChildViewController(childVcName: String)->UIViewController?{
        guard let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else {
            return nil
        }
        guard let childVcClass = NSClassFromString("\(nameSpace).\(childVcName)") else {
            return nil
        }
        guard let childVcType = childVcClass as? UIViewController.Type else {
            return nil
        }
        let childVc = childVcType.init()
        return childVc
    }

}
