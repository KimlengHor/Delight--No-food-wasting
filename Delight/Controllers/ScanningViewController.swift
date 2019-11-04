//
//  ScanningViewController.swift
//  Delight
//
//  Created by hor kimleng on 10/14/19.
//  Copyright © 2019 kimlenghor. All rights reserved.
//

import UIKit
import CoreML
import Vision
import AVFoundation

class ScanningViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {

    //IBOutlets
    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var firstFoodLabel: UILabel!
    @IBOutlet weak var secondFoodLabel: UILabel!
    @IBOutlet weak var thirdFoodLabel: UILabel!
    
    //Variables
    let captureSession = AVCaptureSession()
    var previewLayer:CALayer!
    var captureDevice:AVCaptureDevice!
    var confidenceResults = [VNClassificationObservation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareCamera()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.previewLayer.frame = self.cameraView.layer.bounds
    }

    func prepareCamera() {
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
        
        let availableDevices = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: AVMediaType.video, position: .back).devices
        captureDevice = availableDevices.first
        beginSession()
    }
    
    func beginSession () {
        do {
            let captureDeviceInput = try AVCaptureDeviceInput(device: captureDevice)
            
            captureSession.addInput(captureDeviceInput)
            
        }catch {
            print(error.localizedDescription)
        }
        
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        self.previewLayer = previewLayer
        self.cameraView.layer.addSublayer(self.previewLayer)
        self.previewLayer.frame = self.cameraView.layer.bounds
        captureSession.startRunning()
        
        let dataOutput = AVCaptureVideoDataOutput()
        dataOutput.videoSettings = [((kCVPixelBufferPixelFormatTypeKey as NSString) as String):NSNumber(value:kCVPixelFormatType_32BGRA)]
        
        dataOutput.alwaysDiscardsLateVideoFrames = true
        
        if captureSession.canAddOutput(dataOutput) {
            captureSession.addOutput(dataOutput)
        }
        
        captureSession.commitConfiguration()
        
        
        let queue = DispatchQueue(label: "com.kimlenghor.captureQueue")
        dataOutput.setSampleBufferDelegate(self, queue: queue)
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        if let image = self.getImageFromSampleBuffer(buffer: sampleBuffer) {
            detect(image: image)
        }
    }
    
    func getImageFromSampleBuffer (buffer:CMSampleBuffer) -> CIImage? {
        if let pixelBuffer = CMSampleBufferGetImageBuffer(buffer) {
            let ciImage = CIImage(cvPixelBuffer: pixelBuffer)
            return ciImage
        }
        return nil
    }
    
    func detect(image: CIImage) {
        confidenceResults.removeAll()
        
        guard let model = try? VNCoreMLModel(for: MobileNet_model_best().model) else {
            fatalError("Loading CoreML Model Failed.")
        }
        
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let results = request.results as? [VNClassificationObservation] else {
                fatalError("Model failed to process image.")
            }
            let sortedResults = results.sorted(by: {$0.confidence > $1.confidence})
            
            if sortedResults.count > 3 {
                for index in 0..<3  {
                    self.confidenceResults.append(sortedResults[index])
                }
            } else {
                self.confidenceResults = sortedResults
            }
            
            //print(self.confidenceResults)
            DispatchQueue.main.async {
                
                self.firstFoodLabel.text = "\(self.confidenceResults[1].identifier)"
                self.secondFoodLabel.text = "\(self.confidenceResults[0].identifier)"
                self.thirdFoodLabel.text = "\(self.confidenceResults[2].identifier)"
                
                self.resultLabel.text = "\(self.confidenceResults[0].identifier)"
            }
        }
        
        let handler = VNImageRequestHandler(ciImage: image)
        
        do {
            try handler.perform([request])
        } catch {
            print(error)
        }
    }
}
