//
//  FeedController.swift
//  Facegram
//
//  Created by Wilson Sumanang on 3/25/16.
//  Copyright © 2016 Wilson Sumanang. All rights reserved.
//

import UIKit

class FeedController: UITableViewController {
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData() // Refreshed the feed
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if let feed = Post.feed {
            return feed.count
        } else {
            return 0
        }
    }
    
    func postIndex(cellIndex:Int) -> Int {
        return tableView.numberOfSections - cellIndex - 1
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let post = Post.feed![postIndex(section)]
        let headerCell = tableView.dequeueReusableCellWithIdentifier("PostHeaderCell") as? PostHeaderCell
        if post.creator == Profile.currentUser?.username {
            headerCell!.profilePicture.image = Profile.currentUser?.picture
        } else {
            // Set to creator's image
        }
        headerCell?.usernameButton.setTitle(post.creator, forState: .Normal)
        
        let headerView = UIView(frame: headerCell!.frame)
        headerView.addSubview(headerCell!)
        
        return headerView
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let post = Post.feed![postIndex(indexPath.section)]
        let cell = tableView.dequeueReusableCellWithIdentifier("PostCell") as! PostCell
        cell.captionLabel.text = post.caption
        cell.imgView.image = post.image
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 48
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let post = Post.feed![postIndex(indexPath.section)]
        if let img = post.image {
            let aspectRatio = img.size.height / img.size.width
            return tableView.frame.size.width * aspectRatio + 80
        }
        return 208 //default
    }
}
