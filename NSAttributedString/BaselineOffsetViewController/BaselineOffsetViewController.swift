//
//  BaselineOffsetViewController.swift
//  NSAttributedString
//
//  Created by frank.Zhang on 22/01/2018.
//  Copyright © 2018 Frank.Zhang. All rights reserved.
//

import UIKit

class BaselineOffsetViewController: SuperViewController {

    @IBOutlet weak var labelTop: NSLayoutConstraint!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var offsetArray:[CGFloat] = [-11.0,-9.0,-7.0,-5.0,-3.0,-1.0,0,1.0,3.0,5.0,7.0,9.0,11.0]
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    func initUI(){
        self.title = "BaselineOffset"
        self.labelTop.constant = UIApplication.shared.statusBarFrame.height + 44 + 5
        initLabel()
        initTableView()
    }
    
    func initLabel(){
        let attrStr = NSMutableAttributedString.init(string: self.titleStr, attributes: nil)
        label.attributedText = attrStr
    }
    
    func initTableView(){
        hildTableViewExtraCellLineHidden(tableView: self.tableView)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func refreshLabel(index:Int){
        let dict = [NSAttributedStringKey.baselineOffset:self.offsetArray[index]]
        let attrStr = NSMutableAttributedString.init(string: self.titleStr, attributes: dict)
        label.attributedText = attrStr
    }
}
extension BaselineOffsetViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.offsetArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil{
            cell = UITableViewCell.init(style:.default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight(rawValue: 2.0))
        cell?.textLabel?.text = "BaselineOffset:\(self.offsetArray[indexPath.row])"
        cell?.textLabel?.numberOfLines = 0
        return cell!
    }
    
}

extension BaselineOffsetViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        refreshLabel(index: indexPath.row)
    }
}

