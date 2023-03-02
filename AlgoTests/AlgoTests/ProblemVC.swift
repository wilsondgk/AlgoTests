//
//  ViewController.swift
//  AlgoTests
//
//  Created by Wilson Dong Gn Kim on 15/02/23.
//

import UIKit

class ProblemVC: UIViewController {
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [printLabel, runAlgoButton])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var printLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "print"
        return label
    }()
    
    private lazy var runAlgoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Run", for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(runAlgoButtonClicked), for: .touchUpInside)
        return button
    }()
    
    weak var runAlgoDelegate: AlgoRunable?
    private let problem: AlgoExampleStrategy
    
    init(with problem: AlgoExampleStrategy) {
        self.problem = problem
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = problem.title
        runAlgoDelegate = problem
        setupLayout()
    }
    
    private func setupLayout() {
        setupStack()
    }
    
    private func setupStack() {
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
        ])
    }
    
    @objc func runAlgoButtonClicked() {
        runAlgoDelegate?.runAlgo(printLabel)
    }
}

