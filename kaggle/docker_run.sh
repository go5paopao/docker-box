#!/bin/bash

docker run -it --name m5-docker -v /Users/kyo:/work -p 8888:8888 -p 5000:5000 pao-kaggle /bin/bash
