FROM tensorflow/tensorflow:latest-gpu-py3
# Various Python and C/build deps
RUN apt-get update && apt-get install -y \ 
    wget \
    build-essential \ 
    cmake \ 
    git \
    unzip \ 
    pkg-config \
    python-dev \ 
    python-opencv \ 
    libopencv-dev \ 
    libav-tools  \ 
    libjpeg-dev \ 
    libpng-dev \ 
    libtiff-dev \ 
    libjasper-dev \ 
    libgtk2.0-dev \ 
    python-numpy \ 
    python-pycurl \ 
    libatlas-base-dev \
    gfortran \
    webp \ 
    python-opencv \ 
    qt5-default \
    libvtk6-dev \ 
    zlib1g-dev 

# Install Open CV - Warning, this takes absolutely forever
RUN mkdir -p ~/opencv cd ~/opencv && \
    wget https://github.com/Itseez/opencv/archive/3.0.0.zip && \
    unzip 3.0.0.zip && \
    rm 3.0.0.zip && \
    mv opencv-3.0.0 OpenCV && \
    cd OpenCV && \
    mkdir build 
RUN  cd ~/opencv/ && ls
RUN cd OpenCV/build && \
    cmake \
    -DWITH_CUDA=OFF\
    -DWITH_QT=ON \ 
    -DWITH_OPENGL=ON \ 
    -DFORCE_VTK=ON \
    -DWITH_TBB=ON \
    -DWITH_GDAL=ON \
    -DWITH_XINE=ON \
    -DBUILD_EXAMPLES=ON .. && \
    make -j4 
RUN  cd OpenCV/build &&   make install && \ 
    ldconfig
RUN apt-get update && apt-get install -y imagemagick
COPY jupyter_notebook_config.py /root/.jupyter/
COPY run_jupyter.sh /
RUN chmod +x /run_jupyter.sh
RUN pip install Cython --install-option="--no-cython-compile"
RUN pip install fasttext tflearn scikit-image scikit-learn nltk pandas gensim praw keras
RUN pip install git+https://github.com/jakevdp/JSAnimation.git
RUN apt-get install -y swig
RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension
RUN pip install numpy numba scipy pandas
WORKDIR "/notebooks" 
CMD ["/run_jupyter.sh"]


