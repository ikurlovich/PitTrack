//
//  ImageStorageService.swift
//  PitTrack
//
//  Created by Ilia Kurlovich on 03.08.25.
//

import UIKit

final class ImageStorageService {
    static let shared = ImageStorageService()
    private init() {}

    private let directory: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]

    func saveImage(_ image: UIImage) throws -> String {
        let filename = UUID().uuidString + ".jpg"
        let fileURL = directory.appendingPathComponent(filename)

        guard let data = image.jpegData(compressionQuality: 0.9) else {
            throw NSError(domain: "ImageStorageService", code: 1, userInfo: [NSLocalizedDescriptionKey: "JPEG conversion failed"])
        }

        try data.write(to: fileURL)
        return filename
    }

    func loadImage(from path: String?) -> UIImage? {
        guard let path else { return nil }
        let fileURL = directory.appendingPathComponent(path)
        return UIImage(contentsOfFile: fileURL.path)
    }

    func deleteImage(at path: String?) {
        guard let path else { return }
        let fileURL = directory.appendingPathComponent(path)
        try? FileManager.default.removeItem(at: fileURL)
    }
}
