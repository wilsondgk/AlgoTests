//
//  ProblemListVC.swift
//  AlgoTests
//
//  Created by Wilson Dong Gn Kim on 01/03/23.
//

import Foundation
import UIKit

class ProblemListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let problems: [AlgoExampleStrategy]
    
    private lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    var firstPushVC: UIViewController?
    
    init(withProblems problems: [AlgoExampleStrategy]) {
        self.problems = problems
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        title = "Algo Problems"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if firstPushVC ==  nil {
            firstPushVC = ProblemVC(with: problems.last!)
            self.navigationController?.pushViewController(firstPushVC!, animated: true)
        }
    }
    
    private func setupLayout() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = problems[indexPath.row].title
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return problems.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ProblemVC(with: problems[indexPath.row])
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
