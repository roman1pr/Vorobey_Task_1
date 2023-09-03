//
//  ViewController.swift
//  UIKit_task1
//
//  Created by Роман Приискалов on 03.09.2023.
//

import UIKit

//Поместить на экран квадратную вью.

//- Закруглить края.
//- Покрасить градиентом.
//- Установить тень.
//- Вью всегда по центру по вертикали и 100pt от левого края.

class ViewController: UIViewController {
    
    let width: CGFloat = 100
    let height: CGFloat = 100

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Создаем вью
        let squareView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        
        // Создаем градиентный слой
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = squareView.bounds
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor] // Цвета градиента
        
        // Добавляем градиентный слой
        squareView.layer.addSublayer(gradientLayer)

        // Создаем маску с скругленными краями
        let maskPath = UIBezierPath(roundedRect: squareView.bounds, cornerRadius: 10).cgPath
        let maskLayer = CAShapeLayer()
        maskLayer.path = maskPath
        
        // Устанавливаем маску на градиентный слой
        gradientLayer.mask = maskLayer
        
        // Устанавливаем тень
        squareView.layer.shadowColor = UIColor.black.cgColor
        squareView.layer.shadowOpacity = 0.65
        squareView.layer.shadowOffset = CGSize(width: 5, height: 5)
        squareView.layer.shadowRadius = 15

        view.addSubview(squareView)
        
        // Устанавливаем ограничения для позиционирования
        squareView.translatesAutoresizingMaskIntoConstraints = false
        squareView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        squareView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100).isActive = true
        squareView.widthAnchor.constraint(equalToConstant: width).isActive = true
        squareView.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
}
