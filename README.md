# Complex Numbers II

![excerpt from video](https://raw.githubusercontent.com/jlpaca/complex-numbers-video-ii/master/resources/preview.gif)

This is the source code to some animations illustrating some numbers wiggling around on the complex plane.

These animations were part of a [video](https://youtu.be/vF3Gw_eprZI) in a series circulated to first-year maths students at Imperial College London. Each video reviewed a topic in maths that the students were expected to be familiar with; this was the second video on complex numbers. They were part of a [StudentShapers project](https://www.imperial.ac.uk/students/studentshapers/).

## But why?
At the time of the project (August 2019), I knew my way around a few ways of getting a computer to make pretty images that moved. These included:

* [Flash](https://en.wikipedia.org/wiki/Adobe_Flash#Macromedia).
* [javascript/GLSL](https://en.wikipedia.org/wiki/WebGL) was my go-to for [maths-y visualisation-y things](https://jlpaca.github.io/toybox), but I got stuck trying to find a nice straightforward way of exporting canvas output a video format like `mp4`.
* [Blender](https://www.blender.org/) is amazing, but also overkill.

Most importantly, because this  was maths, I wanted to have [nice typography](https://www.latex-project.org/) for the funny symbols and stuff, but the best solutions I could find for incorporating material typeset in LaTeX into any of my animation options was pulling some `svg` shenanigans and then working with each piece of text as an image.

All of this was pain.

In the absence of something that would let me put LaTeX into animations, I ended up deciding that I would just do my animations in LaTeX instead.


## Wait, what?

I spent a weekend throwing together some macros that interpolated between numbers, and a few more that multiplied and divided some dimensions so the resolution and framerate would work out. I also grepped the [pgf manual](http://mirrors.ctan.org/graphics/pgf/base/doc/pgfmanual.pdf) and learnt how to do stuff with `pgfkeys` so that those macros are kind of sort of readable (`tween[start=0, duration=0.2]{0}{1}`!)

Now I was writing down the parametrisation of a scene, and compiling a tex file to get a `dvi` with one page for each frame of the animation. Temporarily setting the framerate to something like 8 frames per second, I could compile up to a few seconds of animation reasonably quickly, and scrub through the resulting file in a `doc-view` window to see how it looked.

Eventually the source would be compiled at a full 24fps, turned into a sequence of frames with `gs`, then piped into `ffmpeg` to be stitched together into an actual `mp4`. Ta-da, maths animations with nice LaTeX typesetting for the text!

All of this was still pain, but it is now my fault. Delightful.

## Where is this going?

This code is mostly being left here for personal / historical interest. An [effort](https://github.com/jlpaca/tween) is tentatively being made to put the reusable parts of the code into presentable shape.
