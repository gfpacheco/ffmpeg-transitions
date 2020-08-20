generate_gif()
{
  `./$1.sh`
  ffmpeg \
    -y \
    -ss 2.5 \
    -t 3.5 \
    -i output.mp4 \
    -filter_complex "\
      [0:v]scale=240:-1[s];\
      [s]split[a][b];\
      [a]palettegen[p];\
      [b]fifo[c];\
      [c][p]paletteuse\
    " \
    assets/$1.gif
}

for file in *.sh
do
  if [[ "$file" != "generate-gifs.sh" ]]
  then
    transition="${file%.*}"
    generate_gif $transition
  fi
done
