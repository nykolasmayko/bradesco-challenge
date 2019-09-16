//
//  LibraryTableViewCell.swift
//  bradesco-challenge
//
//  Created by Nykolas Mayko on 15/09/19.
//  Copyright © 2019 Nykolas Mayko. All rights reserved.
//

import UIKit

class LibraryTableViewCell: UITableViewCell{
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var ownerName: UILabel!
    @IBOutlet weak var watchers: UILabel!
    @IBOutlet weak var avatarImgView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func config(for lib: Library){
        name.text = lib.name
        ownerName.text = lib.owner?.login
        watchers.text = String(describing: lib.watchers ?? 0)
        if let avatar = lib.owner?.avatarImage {
            avatarImgView.image = avatar
        }else{
            getAvatar(for: lib.owner)
        }
        
    }
    
    func getAvatar(for owner: Owner?) {
        guard let owner = owner else{
            return
        }
        
        guard let avatarURL = owner.avatarURL else {
            return
        }
        let avatarRequest = ImageRequest(url: avatarURL)
        avatarRequest.load(withCompletion: { (avatar: UIImage?) in
            guard let avatar = avatar else {
                return
            }
            DispatchQueue.main.async {
                owner.avatarImage = avatar
                self.avatarImgView.image = avatar
            }
            
        })
    }
}
