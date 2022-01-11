//
//  ModalViewController.swift
//  ModalControllers
//
//  Created by Даниил on 29.11.2019.
//  Copyright © 2019 Даниил. All rights reserved.
//

import UIKit

class BottomSlideMenuViewController: UIViewController {
    
    //MARK: - @IBOutlets
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var mobileView: UIView!
    @IBOutlet weak var touchArea: UIView!
    
    //MARK: - Public properties
    
    lazy var presenter = BottomSlideMenuPresenter()
    
    //MARK: - Private properties and enums
    
    private enum BottomSlideMenuPosition: CGFloat {
        case top = 0.1
        case middle = 0.5
        case hidden = 1
    }

    private enum BottomSlideMenuDirection {
        case up
        case down
    }
    
    private var position: BottomSlideMenuPosition = .middle
    private var direction: BottomSlideMenuDirection = .up
    private var previousPanYCoordinate: CGFloat = 0
    private var panYCoordinate: CGFloat = 0
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Use if you want to get ios 13 style of modal view controllers
        //configureMenu()
        addPanRecognizer()
        
    }
    
    //MARK: - Bottom slide menu engine
    
    private func configureMenu() {
        self.modalPresentationStyle = .overCurrentContext
        self.modalTransitionStyle = .coverVertical
    }
    
    private func addPanRecognizer() {
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panHandler))
        self.touchArea.addGestureRecognizer(panRecognizer)
    }
    
    @objc private func panHandler(_ gestureRecognizer: UIPanGestureRecognizer) {
        switch gestureRecognizer.state {
        case .began:
            previousPanYCoordinate = gestureRecognizer.location(in: self.view).y
        case .changed:
            determineDirection(gestureRecognizer: gestureRecognizer)
            checkBoundsAndShiftView(gestureRecognizer: gestureRecognizer)
        default:
            calculateFurtherActions(gestureRecognizer: gestureRecognizer)
        }
    }
    
    private func determineDirection(gestureRecognizer: UIPanGestureRecognizer) {
        let velocity = gestureRecognizer.velocity(in: self.mobileView)
        
        if velocity.y > 0{
            self.direction = .down
        }else if velocity.y < 0{
            self.direction = .up
        }
    }
    
    private func checkBoundsAndShiftView(gestureRecognizer: UIPanGestureRecognizer) {
        let yCoordinate = mobileView.frame.origin.y
        if yCoordinate > 25 {
            shiftView(gestureRecognizer: gestureRecognizer)
        }
    }
    
    private func shiftView(gestureRecognizer: UIPanGestureRecognizer) {
        panYCoordinate = gestureRecognizer.location(in: self.view).y
        self.mobileView.frame.origin.y -= previousPanYCoordinate - panYCoordinate
        previousPanYCoordinate = panYCoordinate
    }
    
    private func calculateFurtherActions(gestureRecognizer: UIPanGestureRecognizer) {
        var nextPosition: BottomSlideMenuPosition = .hidden
        let velocityY = gestureRecognizer.velocity(in: self.view).y
        
        if velocityY > 2000 {
            nextPosition = .hidden
        } else if velocityY < -2000 {
            nextPosition = .top
        } else {
            nextPosition = checkVelocityAndCalculatePosition(gestureRecognizer: gestureRecognizer)
        }
        
        moveTo(nextPosition)
    }
    
    private func checkVelocityAndCalculatePosition(gestureRecognizer: UIPanGestureRecognizer) -> BottomSlideMenuPosition {
        let velocityY = gestureRecognizer.velocity(in: self.view).y.magnitude
        var nextPosition: BottomSlideMenuPosition = .hidden
        
        if velocityY < 30 {
            nextPosition = calculateNextPosition(gestureRecognizer: gestureRecognizer, accordingToDirection: false)
        } else {
            nextPosition = calculateNextPosition(gestureRecognizer: gestureRecognizer, accordingToDirection: true)
        }
        
        return nextPosition
    }
    
    private func calculateNextPosition(gestureRecognizer: UIPanGestureRecognizer, accordingToDirection: Bool) -> BottomSlideMenuPosition {
        var nextPosition: BottomSlideMenuPosition = .hidden
        let currentYLocation = self.mobileView.frame.origin.y
        
        if currentYLocation <= (BottomSlideMenuPosition.top.rawValue * self.contentView.frame.height) {
            nextPosition = .top
        } else if currentYLocation <= (BottomSlideMenuPosition.middle.rawValue * self.contentView.frame.height) && currentYLocation > (BottomSlideMenuPosition.top.rawValue * self.contentView.frame.height) {
            nextPosition = setNextPositionWhenBetweenTopAndMiddlePosition(currentYLocation: currentYLocation, accordingToDirection: accordingToDirection)
        } else if currentYLocation > (BottomSlideMenuPosition.middle.rawValue * self.contentView.frame.height) {
            nextPosition = setNextPositionWhenBetweenMiddleAndHiddenPosition(currentYLocation: currentYLocation, accordingToDirection: accordingToDirection)
        }
        
        return nextPosition
    }
    
    private func setNextPositionWhenBetweenTopAndMiddlePosition(currentYLocation: CGFloat, accordingToDirection: Bool) -> BottomSlideMenuPosition {
        var nextPosition: BottomSlideMenuPosition = .hidden
        
        if accordingToDirection {
            if self.direction == .up {
                nextPosition = .top
            } else {
                nextPosition = .middle
            }
        } else {
            if currentYLocation - (BottomSlideMenuPosition.top.rawValue * self.contentView.frame.height) > (BottomSlideMenuPosition.middle.rawValue * self.contentView.frame.height) - currentYLocation {
                nextPosition = .middle
            } else {
                nextPosition = .top
            }
        }
        
        return nextPosition
    }
    
    private func setNextPositionWhenBetweenMiddleAndHiddenPosition(currentYLocation: CGFloat, accordingToDirection: Bool) -> BottomSlideMenuPosition {
        var nextPosition: BottomSlideMenuPosition = .hidden
        
        if accordingToDirection {
            if self.direction == .up {
                nextPosition = .middle
            } else {
                nextPosition = .hidden
            }
        } else {
            if currentYLocation - (BottomSlideMenuPosition.middle.rawValue * self.contentView.frame.height) > (BottomSlideMenuPosition.hidden.rawValue * self.contentView.frame.height) - currentYLocation {
                nextPosition = .hidden
            } else {
                nextPosition = .middle
            }
        }
        
        return nextPosition
    }
    
    private func moveTo(_ position: BottomSlideMenuPosition) {
        switch position {
        case .top:
            prepareToAnimate(position: .top)
        case .middle:
            prepareToAnimate(position: .middle)
        case .hidden:
            self.dismiss(animated: true, completion: nil)
            prepareToAnimate(position: .hidden)
        }
    }
    
    private func prepareToAnimate(position: BottomSlideMenuPosition) {
        self.position = position
        animate { [weak self] in
            guard let weakSelf = self else {return}
            weakSelf.mobileView.frame.origin.y = position.rawValue * weakSelf.contentView.frame.height
        }
    }
    
    private func animate(action: @escaping (() -> Void)) {
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut, animations: {
            action()
        })
    }
    
    //MARK: - Place your logic here
    
}
