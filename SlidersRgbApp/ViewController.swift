//
//  ViewController.swift
//  SlidersRgbApp
//
//  Created by Egor Ukolov on 20.11.2022.
//

import UIKit



class ViewController: UIViewController {
    
    @IBOutlet var multiColorView: UIView!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redValueSlider: UISlider!
    @IBOutlet var greenValueSlider: UISlider!
    @IBOutlet var blueValueSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redValueSlider.tintColor = .red
        greenValueSlider.tintColor = .green
        
        multiColorView.layer.cornerRadius = 15
        
        setColor()
        setValue(for: redValueLabel, greenValueLabel, blueValueLabel)
        
    }

    
    @IBAction func sliderAction(_ sender: UISlider) {
        switch sender {
        case redValueSlider: redValueLabel.text = string(from: sender)
        case greenValueSlider: greenValueLabel.text = string(from: sender)
        case blueValueSlider: blueValueLabel.text = string(from: sender)
            
        default: break
        }
        
        
        setColor()
    }
    
    private func setColor() {
        multiColorView.backgroundColor = UIColor(red: CGFloat(redValueSlider.value),
                                                 green: CGFloat(greenValueSlider.value),
                                                 blue: CGFloat(blueValueSlider.value), alpha: 1)
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach {label in
            switch label.tag {
            case 0: redValueLabel.text = string(from: redValueSlider)
            case 1: greenValueLabel.text = string(from: greenValueSlider)
            case 2: blueValueLabel.text = string(from: blueValueSlider)
            default: break
            }
            
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
}

