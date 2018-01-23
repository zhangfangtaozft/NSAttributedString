//
//  BoldSystemFontViewController.swift
//  NSAttributedString
//
//  Created by frank.Zhang on 19/01/2018.
//  Copyright © 2018 Frank.Zhang. All rights reserved.
//

import UIKit

class BoldSystemFontViewController: SuperViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var labelTop: NSLayoutConstraint!
    
    var fontArray: [UIFont] = [UIFont.systemFont(ofSize: 15),UIFont.boldSystemFont(ofSize: 15),UIFont.italicSystemFont(ofSize: 15),UIFont.systemFont(ofSize: 20),UIFont.boldSystemFont(ofSize: 20),UIFont.italicSystemFont(ofSize: 20),UIFont.systemFont(ofSize: 25),UIFont.boldSystemFont(ofSize: 25),UIFont.italicSystemFont(ofSize: 25)]
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    func initUI(){
        self.title = "BoldSystemFont"
        self.labelTop.constant = UIApplication.shared.statusBarFrame.height + 44
        initLabel()
        initTableView()
    }
    
    func initLabel(){
        let attrStr = NSMutableAttributedString.init(string: self.titleStr, attributes: nil)
        label.attributedText = attrStr
    }
    
    func refreshLabel(font:UIFont){
        let dict = [NSAttributedStringKey.font:font]
        let attrStr = NSMutableAttributedString.init(string: self.titleStr, attributes: dict)
        label.attributedText = attrStr
    }
    func initTableView(){
        hildTableViewExtraCellLineHidden(tableView: self.tableView)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}
extension BoldSystemFontViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.fontArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil{
            cell = UITableViewCell.init(style:.default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight(rawValue: 2.0))
        cell?.textLabel?.text = "fontSize:\(self.fontArray[indexPath.row].pointSize),fontName:\(self.fontArray[indexPath.row].fontName)"
        return cell!
    }
}

extension BoldSystemFontViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        refreshLabel(font: self.fontArray[indexPath.row])
    }
}

