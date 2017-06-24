//
//  JenIndex.swift
//  iOS Assignment UI 2
//
//  Created by Jenhao on 2016-07-31.
//  Copyright © 2016 Jenhao. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox


class JenIndex: UIViewController {
    
    
    
    @IBOutlet weak var opening: UILabel!
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var Go: UIButton!
    
    
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        opening.text = "Try to answer five question about the walking dead TV series.\nSurvive and come back, \ngood luck !"
        Go.setTitle("Let's Go", for: UIControlState())
        bgImage.image = UIImage(imageLiteralResourceName: "post4")
        
     
        playSound()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func playSound() {
        
        
        
            let url = Bundle.main.url(forResource: "end3", withExtension: "mp3")!
        
            do {
                
                player = try AVAudioPlayer(contentsOf: url)
                
                guard let player = player else { return }
                player.stop()
                player.numberOfLoops = -1
//              player.prepareToPlay()
                player.play()
                
            } catch let error as NSError {
                print(error.description)
            }
        }
    
    func StopPlaySound(){
        let url = Bundle.main.url(forResource: "go", withExtension: "mp3")!
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            
         player.stop()
        } catch let error as NSError {
            print(error.description)
        }
    }
    



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
