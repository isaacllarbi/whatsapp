import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraTab extends StatefulWidget {
  @override
  _CameraTabState createState() => _CameraTabState();
}

class _CameraTabState extends State<CameraTab> {
  bool cameraReady = false;
  bool flashOff = false;
  CameraController controller;
  bool backCamera = true;
  List<CameraDescription> cameras;

  @override
  void initState() {
    requestCameraAccess();
    super.initState();
  }

  requestCameraAccess() async {
    try {
      cameras = await availableCameras();
      controller = CameraController(cameras[0], ResolutionPreset.high);
      await controller.initialize();
      if (!mounted) {
        return;
      }
      setState(() {
        cameraReady = true;
      });
    } catch (err) {
      print(err.toString());
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    if (cameraReady) {
      return Stack(
        children: [
          AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: CameraPreview(controller),
          ),
          Align(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Icon(flashOff ? Icons.flash_off : Icons.flash_on,
                        size: 35, color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: GestureDetector(
                      child:
                          Icon(Icons.add_circle, size: 85, color: Colors.white),
                      onTap: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: GestureDetector(
                      onTap: () async {
                        print('Camera switch start');
                        try {
                          if (backCamera) {
                            controller = CameraController(
                                cameras[1], ResolutionPreset.high);
                            await controller.initialize();
                            if (!mounted) {
                              return;
                            }
                            setState(() {
                              cameraReady = true;
                              controller = controller;
                              backCamera = !backCamera;
                            });
                          } else {
                            controller = CameraController(
                                cameras[0], ResolutionPreset.high);
                            await controller.initialize();
                            if (!mounted) {
                              return;
                            }
                            setState(() {
                              cameraReady = true;
                              controller = controller;
                              backCamera = !backCamera;
                            });
                          }
                        } catch (err) {
                          print(err.toString());
                        }
                        print('Camera switch end');
                      },
                      child: Icon(Icons.switch_camera,
                          size: 35, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            alignment: Alignment.bottomCenter,
          ),
        ],
      );
    } else {
      return Container(
        height: size.height,
        width: size.width,
        color: Colors.black,
      );
    }
  }
}
