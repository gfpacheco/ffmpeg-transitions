ffmpeg \
  -y \
  -i assets/0.mp4 \
  -i assets/1.mp4 \
  -filter_complex "\
    color=c=black:size=640x360[background]; \
    [0:v]format=argb,rotate='min(0,3.75-t)*2*PI:ow=hypot(iw,ih):oh=ow:c=black@0',setpts=PTS-STARTPTS[0v]; \
    [1:v]format=argb,rotate='max(0,0.25-t)*2*PI:ow=hypot(iw,ih):oh=ow:c=black@0',setpts=PTS-STARTPTS+3.75/TB[1v]; \
    [background][0v]overlay=\
      x='-W/2*cos(min(0,3.75-t)*2*PI)+H/2*sin(min(0,3.75-t)*2*PI)+W-w/2':\
      y='-W/2*sin(min(0,3.75-t)*2*PI)-H/2*cos(min(0,3.75-t)*2*PI)+H-h/2':\
      shortest=1[0vv]; \
    [0vv][1v]overlay=\
      x='-W/2*cos(max(0,4-t)*2*PI)+H/2*sin(max(0,4-t)*2*PI)+W-w/2':\
      y='-W/2*sin(max(0,4-t)*2*PI)-H/2*cos(max(0,4-t)*2*PI)+H-h/2'\
      [v] \
  " -map [v] output.mp4
