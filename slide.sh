ffmpeg \
  -y \
  -i assets/0.mp4 \
  -i assets/1.mp4 \
  -filter_complex "\
    color=c=black:size=640x360[b]; \
    [0:v]setpts=PTS-STARTPTS[0v]; \
    [1:v]setpts=PTS-STARTPTS+3.75/TB[1v]; \
    [b][0v]overlay=x='min((3.75-t)*4*W\,0)':shortest=1[0vv]; \
    [0vv][1v]overlay=x='W-min((t-3.75)*4*W\,W)'[v] \
  " -map [v] output.mp4
