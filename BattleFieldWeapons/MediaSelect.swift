//
//  MediaSelect.swift
//  HelloWorld
//
//  Created by 黄小白 on 2019/1/7.
//  Copyright © 2019 Sherley Huang's studio. All rights reserved.
//

import UIKit
import MobileCoreServices
import AVFoundation


extension NewWeaponController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! String
        
        if mediaType == (kUTTypeMovie as String) {
            videoUrl = (info[UIImagePickerController.InfoKey.mediaURL] as! URL)
            
            // 将视频地址转换成视频资源
            let asset = AVAsset(url: videoUrl)
            
            // 从视频资源中产生一张图片
            let generator = AVAssetImageGenerator(asset: asset)
            // 从哪一段时间产生图片
            let time = CMTime(seconds: 0, preferredTimescale: 1)
            let image = try! generator.copyCGImage(at: time, actualTime: nil)
            bgImageView.image = UIImage(cgImage: image)
            
            playBtn.isHidden = false
            
        } else {
            bgImageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        }
        
        // 关闭相册
        picker.dismiss(animated: true, completion: nil)
    }
    
}

extension NewWeaponController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            
            let photoAction = UIAlertAction(title: "Photo", style: .default) { (_) in
                
                guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
                    return
                }
                let picker = UIImagePickerController()
                picker.sourceType = .photoLibrary
                
                picker.delegate = self
                self.present(picker, animated: true)
                
            }
            
            let takePhotoAction = UIAlertAction(title: "Take a Photo", style: .default) { (_) in
                
                guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
                    return
                }
                
                let picker = UIImagePickerController()
                picker.sourceType = .camera
                
                picker.delegate = self
                self.present(picker, animated: true)
                
            }
            
            let videoAction = UIAlertAction(title: "Video", style: .default) { (_) in
                
                guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
                    return
                }
                
                let picker = UIImagePickerController()
                picker.sourceType = .photoLibrary
                picker.mediaTypes = [kUTTypeMovie as String]
                
                picker.delegate = self
                self.present(picker, animated: true)
                
            }
            
            let recordAction = UIAlertAction(title: "Record a video", style: .default) { (_) in

                guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
                    return
                }
                
                let picker = UIImagePickerController()
                picker.sourceType = .camera
                
                picker.mediaTypes = [kUTTypeMovie as String]
                picker.videoQuality = .typeHigh
                picker.videoMaximumDuration = 10
                
                picker.delegate = self
                self.present(picker, animated: true)
                
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            
            actionSheet.addAction(photoAction)
            actionSheet.addAction(takePhotoAction)
            actionSheet.addAction(videoAction)
            actionSheet.addAction(recordAction)
            actionSheet.addAction(cancelAction)
            
            present(actionSheet, animated: true)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
