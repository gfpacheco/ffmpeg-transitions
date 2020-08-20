ffmpeg \
  -y \
  -i assets/0.mp4 \
  -i assets/1.mp4 \
  -filter_complex "\
    [0:v]setdar=16/9,setpts=PTS-STARTPTS[0v]; \
    [1:v]setdar=16/9,setpts=PTS-STARTPTS+3.75/TB[1v]; \
    [0v][1v]blend=all_expr='if(lte(min(1,max((T-3.75)/0.25,0)),1-X/W),A,B)'[v] \
  " -map [v] output.mp4
