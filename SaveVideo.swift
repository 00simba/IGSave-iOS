//
//  SaveVideo.swift
//  IGSave
//
//  Created by Sameer Qureshi on 2023-06-04.
//

import Foundation
import Photos

func saveVideo(vidUrl: String){
    let fileName = vidUrl.components(separatedBy: "/")[5].components(separatedBy: ".")[0]
    DispatchQueue.global(qos: .background).async {
        if let url = URL(string: vidUrl),
            let urlData = NSData(contentsOf: url)
        {
            let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0];
            let filePath="\(documentsPath)/\(fileName).mp4"
            DispatchQueue.main.async {
                urlData.write(toFile: filePath, atomically: true)
                PHPhotoLibrary.shared().performChanges({
                    PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: URL(fileURLWithPath: filePath))
                }) { completed, error in
                    if completed {
                        print("Video is saved!")
                    }
                }
            }
        }
    }
}

