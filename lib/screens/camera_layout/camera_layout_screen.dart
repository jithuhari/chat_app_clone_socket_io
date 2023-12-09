import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

List<CameraDescription>? cameras;

class CameraLayoutScreen extends StatefulWidget {
  const CameraLayoutScreen({super.key});

  @override
  State<CameraLayoutScreen> createState() => _CameraLayoutScreenState();
}

class _CameraLayoutScreenState extends State<CameraLayoutScreen> {
  CameraController? _cameraController;

  Future<void>? cameraValue;

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(cameras![0], ResolutionPreset.high);
    cameraValue = _cameraController!.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Stack(
          children: [
            FutureBuilder(
                future: cameraValue,
                builder: (context, snapShot) {
                  if (snapShot.connectionState == ConnectionState.done) {
                    return CameraPreview(_cameraController!);
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
            Positioned(
              bottom: 0.0,
              child: Container(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                color: Colors.black,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.flash_off,
                              color: Colors.white,
                              size: 28,
                            )),
                        InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.panorama_fisheye,
                            color: Colors.white,
                            size: 70,
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.flip_camera_ios,
                              color: Colors.white,
                              size: 28,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const Text(
                      'Hold for Video, tap for photo',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
