#!/bin/bash

/audiveris/bin/Audiveris \
  -batch \
  -export \
  -output /output/ \
  $(ls /input/*.jpg /input/*.png /input/*.pdf)

unzip /output/*.mxl -d /output
