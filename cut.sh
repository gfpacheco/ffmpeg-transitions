ffmpeg \
  -y \
  -i assets/0.mp4 \
  -i assets/1.mp4 \
  -filter_complex [0][1]concat=n=2:v=1:a=0[v] \
  -map [v] output.mp4
