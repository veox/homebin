#!/usr/bin/env python

import random
import os
import subprocess

imgdir = "/home/veox/img/movie-cuts/johnny-mnemonic"

images = []
for (dirpath, dirnames, filenames) in os.walk(imgdir):
    images.extend(filenames)
    break

wallpaper = images[random.randrange(len(images) + 1)]
subprocess.run(["feh", "--bg-center", imgdir + '/' + wallpaper])
