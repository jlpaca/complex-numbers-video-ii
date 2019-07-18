FPS=24

render:
	rm -f *.mp4
	pdflatex main.tex
	gs -q -dBATCH -dNOPAUSE -dGraphicsAlphaBits=4 -dTextAlphaBits=4 -sDEVICE=ppmraw -r600x600 -sOutputFile=- main.pdf | ffmpeg -f image2pipe -framerate $(FPS) -probesize 160000000 -i - -c:v libx264 -pix_fmt yuv420p -r $(FPS) out.mp4

