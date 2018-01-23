//
//  ParagraphStyleViewController.swift
//  NSAttributedString
//
//  Created by frank.Zhang on 19/01/2018.
//  Copyright © 2018 Frank.Zhang. All rights reserved.
//

import UIKit

class ParagraphStyleViewController: SuperViewController {

    @IBOutlet weak var labelTop: NSLayoutConstraint!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var tableView: UITableView!
    let paragraphStyleArray: [String] = ["lineSpacing:行间距","paragraphSpacing:段间距","alignment:对齐方式","firstLineHeadIndent:首行缩进","headIndent：整体缩进(首行除外)左边整体的缩进","tailIndent:尾缩进,右边整体的缩进","lineBreakMode:显示不完的时候省略方式","minimumLineHeight：最小行高","maximumLineHeight：最大行高","baseWritingDirection:书写方向","lineHeightMultiple：想要调整行距，可以透过搭配使用 lineHeightMultiple 更改行距倍数","paragraphSpacingBefore：段落头部空白","hyphenationFactor：启用断字功能","tabStops:制表符模式","defaultTabInterval：默认Tab宽度","allowsDefaultTighteningForTruncation：允许默认的收截断收紧功能","addTabStop:添加制表符"," removeTabStop：移除制表符","setParagraphStyle：设置分段落格式"]
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
    
    func refreshLabel(index:Int){
        let style = NSMutableParagraphStyle.init()
        switch index {
        case 0:
            style.lineSpacing = 20.0
            break
        case 1:
            style.paragraphSpacing = 20.0
            break
        case 2:
            style.alignment = .right
            break
        case 3:
            style.firstLineHeadIndent = 20.0
            break
        case 4:
            style.headIndent = 20.0
            break
        case 5:
            style.tailIndent = 20.0
            break
        case 6:
            style.lineBreakMode = .byWordWrapping
            break
        case 7:
            style.minimumLineHeight = 10
            break
        case 8:
            style.maximumLineHeight = 20
            break
        case 9:
            style.baseWritingDirection = .rightToLeft
            break
        case 10:
            style.lineHeightMultiple = 3.0
            break
        case 11:
            style.paragraphSpacingBefore = 20.0
            break
        case 12:
            style.hyphenationFactor = 20.0
            break
        case 13:
            let decimalTab = NSTextTab.init(textAlignment: .right, location: 5, options: [:])
            let percentTab = NSTextTab.init(textAlignment: .left, location: 20, options: [:])
            style.tabStops = [decimalTab,percentTab]
            break
        case 14:
            style.defaultTabInterval = .infinity*2
            break
        case 15:
            style.allowsDefaultTighteningForTruncation = true
            break
        case 16:
            let decimalTab = NSTextTab.init(textAlignment: .right, location: 5, options: [:])
            style.addTabStop(decimalTab)
            break
        case 17:
            let decimalTab = NSTextTab.init(textAlignment: .right, location: 5, options: [:])
            style.removeTabStop(decimalTab)
            break
        case 18:
            let newStyle = NSMutableParagraphStyle.init()
            newStyle.lineSpacing = 30
            style.setParagraphStyle(newStyle)
            break
        default:
            break
        }
        let dict = [NSAttributedStringKey.paragraphStyle:style]
        let attrStr = NSMutableAttributedString.init(string: self.titleStr, attributes: dict)
        label.attributedText = attrStr
    }
    func initTableView(){
        hildTableViewExtraCellLineHidden(tableView: self.tableView)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

extension ParagraphStyleViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.paragraphStyleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil{
            cell = UITableViewCell.init(style:.default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight(rawValue: 2.0))
        cell?.textLabel?.text = self.paragraphStyleArray[indexPath.row]
        cell?.textLabel?.numberOfLines = 0
        return cell!
    }
    
}

extension ParagraphStyleViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        refreshLabel(index:indexPath.row)
    }
}


