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

### Current Sample Data
The implementation now uses professional placeholder data that safely replaces inappropriate content. The placeholder video IDs (TEMP_PLACEHOLDER_*) display professional messaging instead of loading invalid or inappropriate videos. 

## How to Update with Real Playlist Data

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

### Method 3: Browser Console Extraction
1. Open the playlist in a browser
2. Open browser developer tools (F12)
3. Use JavaScript to extract video data from the page
4. Copy the extracted data to update the podcast page

## File Location
The video selector is implemented in `/podcast.md` in the `loadYouTubeVideoSelector()` function (lines ~230-350).

## Testing
A test file has been created at `/tmp/test_podcast.html` to verify the functionality works correctly before deploying changes.

## Notes
- The current implementation uses professional placeholder IDs (TEMP_PLACEHOLDER_*) for safety
- Placeholder content shows professional messaging instead of loading inappropriate videos
- Videos will load with YouTube's embed player once real video IDs are provided
- The interface maintains the site's NES.css theme
- All navigation controls (dropdown, buttons) work correctly
- The layout is responsive for mobile devices
- Safe for production deployment - no inappropriate content will be displayed