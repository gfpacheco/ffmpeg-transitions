ffmpeg \
  -y \
  -i assets/0.mp4 \
  -i assets/1.mp4 \
  -filter_complex "\
    [0:v]fade=t=out:st=3.75:d=0.25:alpha=1,setpts=PTS-STARTPTS[0v]; \
    [1:v]fade=t=in:st=0:d=0.25:alpha=1,setpts=PTS-STARTPTS+3.75/TB[1v]; \
    [0v][1v]overlay[v] \
  " -map [v] output.mp4
