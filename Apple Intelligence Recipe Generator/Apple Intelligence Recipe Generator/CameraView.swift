import SwiftUI
import AVFoundation

struct CameraView: View {
    @State private var isShowingCamera = false
    let session = AVCaptureSession()

    var body: some View {
        VStack {
            if isShowingCamera {
                CameraPreview(session: session)
                    .edgesIgnoringSafeArea(.all)
            } else {
                Button("Show Camera") {
                    setupCamera()
                    isShowingCamera = true
                }
                .padding()
            }
        }
    }

    private func setupCamera() {
        DispatchQueue.main.async {
            let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: .video, position: .back)
            
            guard let captureDevice = deviceDiscoverySession.devices.first else {
                print("Failed to get the camera device")
                return
            }
            
            do {
                let input = try AVCaptureDeviceInput(device: captureDevice)
                session.addInput(input)
            } catch {
                print("Error setting up camera input:", error.localizedDescription)
                return
            }
            
            session.startRunning()
        }
    }
}

struct CameraPreview: UIViewRepresentable {
    let session: AVCaptureSession

    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        let previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.frame = view.layer.bounds
        view.layer.addSublayer(previewLayer)
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        // Update the preview layer when necessary
    }
}
