//
//  ViewController.swift
//  ColorsAppProgrammatically
//
//  Created by admin on 20/04/22.
//

import UIKit

class ViewController: UIViewController{
    
var tableView = UITableView()
    var colors: [UIColor] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = " Colors App "
                createRandomColors()
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    func createRandomColors(){
        for _ in 0..<50{
            colors.append(.random())
        }
    }

}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = colors[indexPath.row]
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let color = colors[indexPath.row]
        let vc = DetailsVC()
        vc.color = color
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension UIColor{
    static func random() -> UIColor {
        let randomColor = UIColor(red: CGFloat.random(in:0...1),
                                  green: CGFloat.random(in:0...1),
                                  blue: CGFloat.random(in:0...1),
                                  alpha: 1)
        return randomColor
    }}

