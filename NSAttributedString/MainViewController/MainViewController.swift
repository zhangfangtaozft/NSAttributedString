//
//  MainViewController.swift
//  NSAttributedString
//
//  Created by frank.Zhang on 19/01/2018.
//  Copyright © 2018 Frank.Zhang. All rights reserved.
//

import UIKit

class MainViewController: SuperViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var listArray:[String] = ["BoldSystemFontViewController","ParagraphStyleViewController","ForegroundColorViewController","BackgroundColorViewController","LigatureViewController","KernViewController","StrikethroughStyleViewController","UnderlineStyleViewController","StrokeColorViewController","StrokeWidthViewController","ShadowViewController","TextEffectViewController","AttachmentViewController","LinkViewController","BaselineOffsetViewController","UnderlineColorViewController","StrikethroughColorViewController","ObliquenessViewController","ExpansionViewController","WritingDirectionViewController","VerticalGlyphFormViewController"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Main"
        initTableView()
    }
    
    func initTableView(){
        hildTableViewExtraCellLineHidden(tableView: self.tableView)
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
   
}

extension MainViewController: UITableViewDataSource{
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell") 
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
        }
        var title = self.listArray[indexPath.row]
        title = title.replacingOccurrences(of: "ViewController", with: "")
        cell?.textLabel?.text = title
        return cell!
    }
}
extension MainViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcType = addChildViewController(childVcName: self.listArray[indexPath.row])
        self.navigationController?.pushViewController(vcType!, animated: true)
    }
}
