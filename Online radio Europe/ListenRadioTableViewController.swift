//
//  ListenRadioTableViewController.swift
//  Online radio Europe
//
//  Created by Elena Moga on 2023-06-20.
//

import UIKit
import AVKit

class ListenRadioTableViewController: UITableViewController {

    var country: Country
    var player: AVPlayer?
    var selectedRadio: Radio?
    
    var playBtn = UIBarButtonItem()
    var pauseBtn = UIBarButtonItem()

    init(country: Country,coder: NSCoder) {
        self.country = country
        super.init(coder: coder)!
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = country.name

        self.playBtn = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: #selector(playBtnAction))
        self.pauseBtn = UIBarButtonItem(barButtonSystemItem: .pause , target: self, action: #selector(pauseBtnAction))

        self.navigationItem.rightBarButtonItem = pauseBtn
        self.navigationItem.rightBarButtonItem?.isHidden = true
    }

    @objc func playBtnAction() {
        
        audioPlayer(url: selectedRadio!.url)
        self.navigationItem.rightBarButtonItem = pauseBtn
    }

    @objc func pauseBtnAction() {
        
        player?.pause()
        self.navigationItem.rightBarButtonItem = playBtn
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return country.radios.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "RadioCell", for: indexPath)
        let radioCell = cell as! RadioTableViewCell
        radioCell.title.text = country.radios[indexPath.row].title
        
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.cyan
        cell.selectedBackgroundView = bgColorView

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.navigationItem.rightBarButtonItem = pauseBtn
        self.navigationItem.rightBarButtonItem?.isHidden = false
        
        selectedRadio = country.radios[indexPath.row]
        
        navigationItem.title = country.name + " - " + selectedRadio!.title
        
        audioPlayer(url: selectedRadio!.url)
    }
    
    func audioPlayer(url: String) {
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            player = AVPlayer(url: URL.init(string: url)!)
            player?.play()
        } catch {
        }
    }
}
