# FFMPEG transition test

These scripts are the result of half a day experimenting with ffmpeg and how to create transitions between video inputs.

Each `.sh` script will merge the same input files (`assets/0.mp4` and `assets/1.mp4`) and output to the same file (`output.mp4`) with different transitions between the two inputs.

## Transitions

### Cut

![cut](./assets/cut.gif)

### Fade to/from black

![fade](./assets/fade.gif)

### Flash from white

![flash](./assets/flash.gif)

### Cross fade

![crossfade](./assets/crossfade.gif)

### Slide

![slide](./assets/slide.gif)

### Wipe

![wipe](./assets/wipe.gif)

### Rotate

![rotate](./assets/rotate.gif)

## TODO

- [ ] Parameterize the duration of the transition
- [ ] Optimize video output
