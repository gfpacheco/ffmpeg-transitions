ffmpeg \
  -y \
  -i assets/0.mp4 \
  -i assets/1.mp4 \
  -filter_complex "\
    [1:v]fade=t=in:st=0:d=0.5:color=white[1v]; \
    [0][1v]concat=n=2:v=1:a=0[v] \
  " -map [v] output.mp4
