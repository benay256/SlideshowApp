//
//  ViewController.swift
//  SlideshowApp
//

//

import UIKit

class ViewController: UIViewController {
    
    // MARK: param
    private var index = 0
    private let imageArray = [
        "FH000001",
        "FH000002",
        "FH000012"
    ]
    
    private var timer: Timer!

    // MARK: IBOutlet
    @IBOutlet private weak var photo: UIImageView!
    
    @IBOutlet private weak var playbackButton: UIButton!
    @IBOutlet private weak var backwardButton: UIButton!
    @IBOutlet private weak var forwardButton: UIButton!
    
    @IBAction private func tapBackward(_ sender: Any) {
        fetchImage(isIncrement: false)
    }
    
    @IBAction private func tapForward(_ sender: Any) {
        fetchImage(isIncrement: true)
    }
    
    @IBAction func tapPlayback(_ sender: Any) {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(autoImageFetcher(_:)), userInfo: nil, repeats: true)
            // 再生中は停止ボタンのImageを表示
            playbackButton.setImage(UIImage(named: "player_button_blue04_teishi"), for: .normal)
            // 停止ボタン以外は無効化
            backwardButton.isEnabled = false
            forwardButton.isEnabled = false
            
        } else {
            timer.invalidate()
            timer = nil
            // 停止ボタン押下時にボタンのImageを再生ボタンにする
            playbackButton.setImage(UIImage(named: "player_button_blue01_saisei"), for: .normal)
            // 再生ボタン以外を有効化
            backwardButton.isEnabled = true
            forwardButton.isEnabled = true
        }
    }
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        photo.image = UIImage(named: "FH000001")
    }
    
    // MARK: Feature
    private func fetchImage(isIncrement: Bool) {
        if isIncrement {
            // 前へ進む押下時
            index = imageArray.count - 1 == index ? 0 : index + 1
        } else {
            // 戻る押下時
            index = index == 0 ? imageArray.count - 1 : index - 1
        }
        
        photo.image = UIImage(named: imageArray[index])
    }
    
    @objc private func autoImageFetcher (_ timer: Timer) {
        // 前へ進む固定
        fetchImage(isIncrement: true)
    }
}

