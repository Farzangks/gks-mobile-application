import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:google_fonts/google_fonts.dart';

/// Enhanced Video Player with fullscreen capability
class VideoPlayer extends StatefulWidget {
  final String videoId;
  final double? height;
  final bool autoPlay;

  const VideoPlayer({
    Key? key,
    required this.videoId,
    this.height = 250,
    this.autoPlay = false,
  }) : super(key: key);

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late YoutubePlayerController _controller;
  bool _isFullScreen = false;

  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  void _initializeController() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: YoutubePlayerFlags(
        autoPlay: widget.autoPlay,
        mute: false,
        enableCaption: true,
        hideControls: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _enterFullScreen() {
    HapticFeedback.mediumImpact();
    setState(() {
      _isFullScreen = true;
    });
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  void _exitFullScreen() {
    HapticFeedback.mediumImpact();
    setState(() {
      _isFullScreen = false;
    });
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isFullScreen) {
      return WillPopScope(
        onWillPop: () async {
          _exitFullScreen();
          return false;
        },
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: Stack(
              children: [
                YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: const Color(0xFFB9121A),
                  onEnded: (metadata) {
                    _exitFullScreen();
                  },
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: IconButton(
                    icon: const Icon(
                      Icons.fullscreen_exit,
                      color: Colors.white,
                      size: 32,
                    ),
                    onPressed: _exitFullScreen,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      height: widget.height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: const Color(0xFFB9121A),
              progressColors: const ProgressBarColors(
                playedColor: Color(0xFFB9121A),
                handleColor: Color(0xFFC26C71),
              ),
              thumbnail: CachedNetworkImage(
                imageUrl: 'https://img.youtube.com/vi/${widget.videoId}/0.jpg',
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: const Color(0xFFF2E6E6),
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Color(0xFFB9121A),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  color: const Color(0xFFF2E6E6),
                  child: const Icon(
                    Icons.error,
                    color: Color(0xFFB9121A),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 12,
              right: 12,
              child: InkWell(
                onTap: _enterFullScreen,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Icon(
                    Icons.fullscreen,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Enhanced Map Viewer with fullscreen capability
class MapViewer extends StatefulWidget {
  final WebViewController mapController;
  final bool isLoading;
  final double height;

  const MapViewer({
    Key? key,
    required this.mapController,
    required this.isLoading,
    this.height = 300,
  }) : super(key: key);

  @override
  State<MapViewer> createState() => _MapViewerState();
}

class _MapViewerState extends State<MapViewer> {
  bool _isFullScreen = false;

  void _enterFullScreen() {
    HapticFeedback.mediumImpact();
    setState(() {
      _isFullScreen = true;
    });
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  void _exitFullScreen() {
    HapticFeedback.mediumImpact();
    setState(() {
      _isFullScreen = false;
    });
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isFullScreen) {
      return WillPopScope(
        onWillPop: () async {
          _exitFullScreen();
          return false;
        },
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              WebViewWidget(controller: widget.mapController),
              if (widget.isLoading)
                const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFFB9121A),
                  ),
                ),
              Positioned(
                top: 16,
                right: 16,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.fullscreen_exit,
                      color: Color(0xFFB9121A),
                      size: 28,
                    ),
                    onPressed: _exitFullScreen,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      height: widget.height,
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            WebViewWidget(controller: widget.mapController),
            if (widget.isLoading)
              Container(
                color: const Color(0xFFF2E6E6),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFFB9121A),
                  ),
                ),
              ),
            Positioned(
              top: 12,
              right: 12,
              child: InkWell(
                onTap: _enterFullScreen,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.fullscreen,
                    color: Color(0xFFB9121A),
                    size: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Enhanced Image Gallery with full screen and better navigation
class ImageGallery extends StatelessWidget {
  final List<String> images;

  const ImageGallery({
    Key? key,
    required this.images,
  }) : super(key: key);

  void _openFullScreenGallery(BuildContext context, int initialIndex) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenGallery(
          images: images,
          initialIndex: initialIndex,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // First image taking full width
        if (images.isNotEmpty)
          GestureDetector(
            onTap: () => _openFullScreenGallery(context, 0),
            child: Container(
              width: double.infinity,
              height: 250,
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Hero(
                      tag: 'gallery-image-0',
                      child: CachedNetworkImage(
                        imageUrl: images[0],
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                        placeholder: (context, url) => Container(
                          color: const Color(0xFFF2E6E6),
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: Color(0xFFB9121A),
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          color: const Color(0xFFF2E6E6),
                          child: const Icon(
                            Icons.error,
                            color: Color(0xFFB9121A),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Icon(
                        Icons.fullscreen,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

        // Grid of remaining images
        if (images.length > 1)
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(top: 4),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1.0,
            ),
            itemCount: images.length > 6 ? 5 : images.length - 1,
            itemBuilder: (context, index) {
              final int actualIndex = index + 1; // Skip the first image
              final bool showMoreOverlay = index == 4 && images.length > 6;

              return GestureDetector(
                onTap: () => _openFullScreenGallery(
                    context, showMoreOverlay ? 0 : actualIndex),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Hero(
                          tag: 'gallery-image-$actualIndex',
                          child: CachedNetworkImage(
                            imageUrl: images[actualIndex],
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              color: const Color(0xFFF2E6E6),
                              child: const Center(
                                child: CircularProgressIndicator(
                                  color: Color(0xFFB9121A),
                                  strokeWidth: 2,
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              color: const Color(0xFFF2E6E6),
                              child: const Icon(
                                Icons.error,
                                color: Color(0xFFB9121A),
                              ),
                            ),
                          ),
                        ),
                        if (showMoreOverlay)
                          Container(
                            color: Colors.black.withOpacity(0.7),
                            child: Center(
                              child: Text(
                                '+${images.length - 5}',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
      ],
    );
  }
}

/// Full Screen Gallery for better image viewing experience
class FullScreenGallery extends StatefulWidget {
  final List<String> images;
  final int initialIndex;

  const FullScreenGallery({
    Key? key,
    required this.images,
    this.initialIndex = 0,
  }) : super(key: key);

  @override
  _FullScreenGalleryState createState() => _FullScreenGalleryState();
}

class _FullScreenGalleryState extends State<FullScreenGallery> {
  late PageController _pageController;
  late int _currentIndex;
  bool _isControlsVisible = true;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _toggleControls() {
    setState(() {
      _isControlsVisible = !_isControlsVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // PhotoView Gallery
          GestureDetector(
            onTap: _toggleControls,
            child: PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: CachedNetworkImageProvider(widget.images[index]),
                  initialScale: PhotoViewComputedScale.contained,
                  minScale: PhotoViewComputedScale.contained * 0.8,
                  maxScale: PhotoViewComputedScale.covered * 2.5,
                  heroAttributes: PhotoViewHeroAttributes(
                    tag: 'gallery-image-$index',
                  ),
                );
              },
              itemCount: widget.images.length,
              loadingBuilder: (context, event) => Container(
                color: Colors.black,
                child: Center(
                  child: CircularProgressIndicator(
                    value: event == null
                        ? 0
                        : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
                    valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFB9121A)),
                  ),
                ),
              ),
              pageController: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              backgroundDecoration: const BoxDecoration(
                color: Colors.black,
              ),
            ),
          ),

          // App Bar (only visible when controls are showing)
          AnimatedOpacity(
            opacity: _isControlsVisible ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 200),
            child: Visibility(
              visible: _isControlsVisible,
              child: Container(
                height: kToolbarHeight + MediaQuery.of(context).padding.top,
                padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.7),
                      Colors.transparent,
                    ],
                  ),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: Text(
                        'Image ${_currentIndex + 1} of ${widget.images.length}',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.share, color: Colors.white),
                      onPressed: () {
                        // Implement share functionality here
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Sharing image...')),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Bottom controls
          AnimatedOpacity(
            opacity: _isControlsVisible ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 200),
            child: Visibility(
              visible: _isControlsVisible,
              child: Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.7),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Image thumbnails
                      Container(
                        height: 70,
                        margin: const EdgeInsets.only(bottom: 20),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: widget.images.length,
                          itemBuilder: (context, index) {
                            final bool isSelected = index == _currentIndex;
                            return GestureDetector(
                              onTap: () {
                                _pageController.animateToPage(
                                  index,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                margin: const EdgeInsets.only(right: 10),
                                width: 60,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: isSelected
                                        ? const Color(0xFFB9121A)
                                        : Colors.transparent,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: CachedNetworkImage(
                                    imageUrl: widget.images[index],
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => Container(
                                      color: Colors.grey[800],
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Container(
                                          color: Colors.grey[800],
                                          child: const Icon(
                                            Icons.error,
                                            color: Color(0xFFB9121A),
                                          ),
                                        ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// WebViewController initialization helper - You can place this in a utility class
WebViewController initializeMapController(String mapContent) {
  String iframeHtml = _getMapHtml(mapContent);

  final String htmlContent = '''
    <!DOCTYPE html>
    <html>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
          body { 
            margin: 0; 
            padding: 0; 
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
          }
          iframe { 
            width: 100%; 
            height: 100%; 
            border: 0;
            max-width: 100%;
            max-height: 100%;
            border-radius: 12px;
          }
        </style>
      </head>
      <body>
        $iframeHtml
      </body>
    </html>
  ''';

  return WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onPageFinished: (String url) {
          // Handle page finished loading
        },
        onWebResourceError: (WebResourceError error) {
          // Handle resource error
          debugPrint('WebView error: ${error.description}');
        },
      ),
    )
    ..loadHtmlString(htmlContent);
}

// Helper function to format map content
String _getMapHtml(String mapContent) {
  if (mapContent.trim().startsWith('<iframe')) {
    return mapContent;
  }

  if (mapContent.startsWith('http')) {
    return '''
      <iframe 
        src="$mapContent" 
        width="600" 
        height="450" 
        style="border:0; border-radius: 12px;" 
        allowfullscreen="" 
        loading="lazy" 
        referrerpolicy="no-referrer-when-downgrade">
      </iframe>
    ''';
  }

  return mapContent;
}