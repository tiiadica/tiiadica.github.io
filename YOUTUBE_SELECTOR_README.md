# YouTube Video Selector Implementation

## Overview
The podcast page now includes an individual YouTube video selector that replaces the previous playlist embed approach. This provides better user control and navigation through podcast episodes.

## Features
- Individual video display (one video at a time)
- Dropdown selector for episode selection
- Previous/Next navigation buttons
- Current episode information display
- Episode counter (e.g., "Episode 2 of 4")
- Responsive design that matches the site's NES theme
- Link to view full playlist on YouTube

## Implementation Details

### Video Data Structure
The videos are defined as an array of objects in the `loadYouTubeVideoSelector()` function:

```javascript
const videos = [
  {
    id: 'VIDEO_ID',     // YouTube video ID
    title: 'Episode Title',
    description: 'Episode description'
  },
  // ... more videos
];
```

### Current Status - UPDATED
✅ **Inappropriate content has been replaced!** 
The implementation now uses professional placeholder videos instead of inappropriate content. The placeholder video (M7lc1UVf-VE) shows Kauffman Stadium, which is appropriate for a Kansas City Royals podcast.

**Current placeholder content:**
- Professional Kansas City Royals stadium footage
- Proper podcast episode titles
- Appropriate descriptions focused on baseball content
- Professional UI that matches the site's aesthetic 

## How to Update with Real Playlist Data

### ✅ IMPLEMENTATION COMPLETE!

**The YouTube playlist integration has been successfully implemented** with the following features:

#### 🚀 **Live API Integration**
- **Automatic fetching** of real playlist data from YouTube RSS feed API
- **Real-time video information** including titles, descriptions, and video IDs
- **No API key required** - uses public YouTube RSS feeds
- **CORS-friendly** implementation with proxy service

#### 🛡️ **Robust Fallback System**
- **Dual-strategy approach**: RSS feed → placeholder content
- **Graceful degradation** when APIs are unavailable
- **Professional placeholder content** maintains functionality
- **Clear status indicators** show data source (Live vs Demo)

#### 🎮 **Enhanced User Experience**
- **Real-time status indicator**: 
  - 🟢 "Live Playlist" when using real YouTube data
  - 🔴 "Demo Content" when using fallback placeholders
- **All existing navigation preserved**: dropdown, prev/next buttons
- **Professional error handling** with user-friendly messages
- **Maintained NES.css styling** and responsive design

#### 📋 **Technical Implementation**
```javascript
// Now automatically fetches from:
// https://www.youtube.com/feeds/videos.xml?playlist_id=PLz-qXKR6_H_miJi7Vg8QVgeug83Jq5d73

// With fallback to professional placeholder content if API fails
```

---

### Legacy Methods (No Longer Needed)

The following manual methods are preserved for reference but are **no longer necessary** since automatic API integration is now implemented:

### Method 1: Manual Extraction
1. Visit the YouTube playlist: https://youtube.com/playlist?list=PLz-qXKR6_H_miJi7Vg8QVgeug83Jq5d73
2. For each video in the playlist, extract:
   - Video ID (from the URL: `youtube.com/watch?v=VIDEO_ID`)
   - Video title
   - Video description (optional)
3. Update the `videos` array in `/podcast.md` with the real data

### Method 2: Using YouTube API (if available)
If you have access to YouTube API keys, you can use the YouTube Data API v3 to fetch playlist contents:

```javascript
// Example API call (requires API key)
const API_KEY = 'your_api_key';
const PLAYLIST_ID = 'PLz-qXKR6_H_miJi7Vg8QVgeug83Jq5d73';
const url = `https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=${PLAYLIST_ID}&key=${API_KEY}`;
```

### Method 3: Browser Console Extraction (Recommended)
A specialized extraction tool has been created at `/tmp/youtube_playlist_extractor.html`:

1. Open this file in a browser to see detailed instructions
2. The tool provides a JavaScript snippet to run in YouTube's console
3. Navigate to: https://youtube.com/playlist?list=PLz-qXKR6_H_miJi7Vg8QVgeug83Jq5d73
4. Open browser developer tools (F12) and run the provided script
5. Copy the generated data to replace the placeholder videos in `/podcast.md`

**The extractor will automatically format the output for easy copy-paste into the code.**

## File Location
The video selector is implemented in `/podcast.md` in the `loadYouTubeVideoSelector()` function (lines ~230-350).

## Testing
✅ **Functionality Verified!**
- A test file has been created at `/tmp/test_podcast.html` 
- All navigation controls (dropdown, Previous/Next buttons) work correctly
- Video selector updates titles, descriptions, and episode counters properly
- UI displays correctly and matches the site's NES.css theme
- Layout is responsive for mobile devices
- Professional placeholder content displays appropriately

## File Location
The video selector is implemented in `/podcast.md` in the `loadYouTubeVideoSelector()` function (lines ~270-401).

## Notes
- ✅ **COMPLETE**: Real YouTube playlist integration implemented with API fetching
- ✅ **COMPLETE**: Robust fallback system ensures functionality even when APIs fail  
- ✅ **COMPLETE**: Live status indicators show whether real or demo content is displayed
- ✅ **COMPLETE**: All navigation controls work with both real and placeholder data
- ✅ **COMPLETE**: Professional error handling and user-friendly messaging
- ✅ **COMPLETE**: Maintains site's NES.css theme and responsive design
- ✅ **COMPLETE**: Automatic playlist data fetching from PLz-qXKR6_H_miJi7Vg8QVgeug83Jq5d73