# FROM ros:noetic - I don't use this because "pal" installs ROS
FROM ubuntu:focal
ENV DEBIAN_FRONTEND noninteractive
LABEL Name=dreamvudocker Version=0.0.1
# Avoid prompting for keyboard layout, which causes
# docker build to hang
# The keyboard file didn't seem to function correctly
# when copyting one from stack overflow, but it did after I copied it directly
# from my own box - whitespace problems?
# Install wget
# RUN echo "#!/bin/sh\nexit 0" > /usr/sbin/policy-rc.d
# https://unix.stackexchange.com/questions/432779/update-rc-d-warning-start-and-stop-actions-are-no-longer-supported-falling-ba
RUN apt-get update \
    && apt-get install -q -y \
    --no-install-recommends \
        apt-utils \
        lzma \
        wget \
        nano \
        vim \
        less \
        ack-grep \
        sudo \
        gnupg2 \
        lsb-core \
        lshw \
        rsync \
        dialog \
        python \
        python3-pip \
    && apt-get clean -q -y \
    && apt-get autoremove -q -y \
    && rm -rf /var/lib/apt/lists/*
# Install CUDA Toolkit 10.2
# RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-ubuntu1804.pin
# RUN mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600
# RUN wget https://developer.download.nvidia.com/compute/cuda/10.2/Prod/local_installers/cuda-repo-ubuntu1804-10-2-local-10.2.89-440.33.01_1.0-1_amd64.deb
# # usar apt
# RUN apt install ./cuda-repo-ubuntu1804-10-2-local-10.2.89-440.33.01_1.0-1_amd64.deb  
# RUN apt-key add /var/cuda-repo-10-2-local-10.2.89-440.33.01/7fa2af80.pub
# RUN apt-get update \
#     && apt-get install -q -y \
#     --no-install-recommends \
#         cuda \
#     && apt-get clean -q -y \
#     && apt-get autoremove -q -y \
#     && rm -rf /var/lib/apt/lists/*
# # Install TensorRT  
# ARG os=ubuntu1804
# ARG tag=8.5.1-cuda-10.2
# ARG tensorrtdeb=nv-tensorrt-local-repo-${os}-${tag}_1.0-1_amd64.deb
# COPY ./${tensorrtdeb} .
# RUN dpkg -i ./${tensorrtdeb}

# RUN echo "/var/nv-tensorrt-local-repo-${os}-${tag}/*-keyring.gpg /usr/share/keyrings/"
# RUN cp /var/nv-tensorrt-local-repo-${os}-${tag}/*-keyring.gpg /usr/share/keyrings/
# RUN ls -l /var

# # nv-tensorrt-local-repo-${os}-${tag}

# #RUN apt install $(find /var/nv-tensorrt-local-repo-${os}-${tag}/ -maxdepth 1 -type f | xargs)

# # RUN apt-get install -y "/var/nv-tensorrt-local-repo-${os}-${tag}/*.deb"

# ENV DEBIAN_FRONTEND=text

# RUN find /var/nv-tensorrt-local-repo-${os}-${tag}/ -maxdepth 1 -type f -name "*.deb" | sort

# RUN find /var/ -maxdepth 2 -type f -name "*libcud*" | sort

# # RUN false

# RUN dpkg -i /var/nv-tensorrt-local-repo-ubuntu1804-8.5.1-cuda-10.2/graphsurgeon-tf_8.5.1-1+cuda10.2_amd64.deb
# RUN dpkg -i /var/nv-tensorrt-local-repo-ubuntu1804-8.5.1-cuda-10.2/onnx-graphsurgeon_8.5.1-1+cuda10.2_amd64.deb

# COPY ./libcudnn8_8.4.1.50-1+cuda10.2_amd64.deb .
# COPY ./libcudnn8-dev_8.4.1.50-1+cuda10.2_amd64.deb .
# RUN dpkg -i libcudnn8_8.4.1.50-1+cuda10.2_amd64.deb
# RUN dpkg -i libcudnn8-dev_8.4.1.50-1+cuda10.2_amd64.deb

# RUN dpkg -i /var/nv-tensorrt-local-repo-ubuntu1804-8.5.1-cuda-10.2/libnvinfer8_8.5.1-1+cuda10.2_amd64.deb
# RUN dpkg -i /var/nv-tensorrt-local-repo-ubuntu1804-8.5.1-cuda-10.2/libnvinfer-plugin8_8.5.1-1+cuda10.2_amd64.deb
# RUN dpkg -i /var/nv-tensorrt-local-repo-ubuntu1804-8.5.1-cuda-10.2/libnvparsers8_8.5.1-1+cuda10.2_amd64.deb
# RUN dpkg -i /var/nv-tensorrt-local-repo-ubuntu1804-8.5.1-cuda-10.2/libnvonnxparsers8_8.5.1-1+cuda10.2_amd64.deb
# RUN dpkg -i /var/nv-tensorrt-local-repo-ubuntu1804-8.5.1-cuda-10.2/libnvinfer-bin_8.5.1-1+cuda10.2_amd64.deb
# RUN dpkg -i /var/nv-tensorrt-local-repo-ubuntu1804-8.5.1-cuda-10.2/libnvinfer-dev_8.5.1-1+cuda10.2_amd64.deb
# RUN dpkg -i /var/nv-tensorrt-local-repo-ubuntu1804-8.5.1-cuda-10.2/libnvinfer-plugin-dev_8.5.1-1+cuda10.2_amd64.deb
# RUN dpkg -i /var/nv-tensorrt-local-repo-ubuntu1804-8.5.1-cuda-10.2/libnvparsers-dev_8.5.1-1+cuda10.2_amd64.deb
# RUN dpkg -i /var/nv-tensorrt-local-repo-ubuntu1804-8.5.1-cuda-10.2/libnvonnxparsers-dev_8.5.1-1+cuda10.2_amd64.deb
# RUN dpkg -i /var/nv-tensorrt-local-repo-ubuntu1804-8.5.1-cuda-10.2/libnvinfer-samples_8.5.1-1+cuda10.2_all.deb
# RUN dpkg -i /var/nv-tensorrt-local-repo-ubuntu1804-8.5.1-cuda-10.2/python3-libnvinfer_8.5.1-1+cuda10.2_amd64.deb
# RUN dpkg -i /var/nv-tensorrt-local-repo-ubuntu1804-8.5.1-cuda-10.2/python3-libnvinfer-dev_8.5.1-1+cuda10.2_amd64.deb
# RUN dpkg -i /var/nv-tensorrt-local-repo-ubuntu1804-8.5.1-cuda-10.2/tensorrt-dev_8.5.1.7-1+cuda10.2_amd64.deb
# RUN dpkg -i /var/nv-tensorrt-local-repo-ubuntu1804-8.5.1-cuda-10.2/tensorrt-libs_8.5.1.7-1+cuda10.2_amd64.deb
# RUN dpkg -i /var/nv-tensorrt-local-repo-ubuntu1804-8.5.1-cuda-10.2/tensorrt_8.5.1.7-1+cuda10.2_amd64.deb
# RUN dpkg -i /var/nv-tensorrt-local-repo-ubuntu1804-8.5.1-cuda-10.2/uff-converter-tf_8.5.1-1+cuda10.2_amd64.deb

# # XXX /var/nv-tensorrt-local-repo-ubuntu1804-8.5.1-cuda-10.2/graphsurgeon-tf_8.5.1-1+cuda10.2_amd64.deb
# #18 XXX 0.281 /var/nv-tensorrt-local-repo-ubuntu1804-8.5.1-cuda-10.2/libnvinfer-bin_8.5.1-1+cuda10.2_amd64.deb
# #18 XXX 0.281 /var/nv-tensohisrrt-local-repo-ubuntu1804-8.5.1-cuda-10.2/libnvinfer-dev_8.5.1-1+cuda10.2_amd64.deb
# #18 XXX 0.281 /var/nv-tensorrt-local-repo-ubuntu1804-8.5.1-cuda-10.2/libnvinfer-plugin-dev_8.5.1-1+cuda10.2_amd64.deb
# #18 XXX 0.281 /var/nv-tensorrt-local-repo-ubuntu1804-8.5.1-cuda-10.2/libnvinfer-plugin8_8.5.1-1+cuda10.2_amd64.deb
# #18 XXX 0.281 /var/nv-tensorrt-local-repo-ubuntu1804-8.5.1-cuda-10.2/libnvinfer-samples_8.5.1-1+cuda10.2_all.deb
# #18 XXX 0.281 /var/nv-tensorrt-local-repo-ubuntu1804-8.5.1-cuda-10.2/libnvinfer8_8.5.1-1+cuda10.2_amd64.deb
# #18 XXX 0.281 /var/nv-tensorrt-local-repo-ubuntu1804-8.5.1-cuda-10.2/libnvonnxparsers-dev_8.5.1-1+cuda10.2_amd64.deb
# # XXX 18 0.281 /var/nv-tensorrt-local-repo-ubuntu1804-8.5.1-cuda-10.2/libnvonnxparsers8_8.5.1-1+cuda10.2_amd64.deb
# # XXX 18 0.281 /var/nv-tensorrt-local-repo-ubuntu1804-8.5.1-cuda-10.2/libnvparsers-dev_8.5.1-1+cuda10.2_amd64.deb
# # XXX 18 0.281 /var/nv-tensorrt-local-repo-ubuntu1804-8.5.1-cuda-10.2/libnvparsers8_8.5.1-1+cuda10.2_amd64.deb
# # XXX 18 0.281 /var/nv-tensorrt-local-repo-ubuntu1804-8.5.1-cuda-10.2/onnx-graphsurgeon_8.5.1-1+cuda10.2_amd64.deb
# # XXX 18 0.281 /var/nv-tensorrt-local-repo-ubuntu1804-8.5.1-cuda-10.2/python3-libnvinfer-dev_8.5.1-1+cuda10.2_amd64.deb
# # XXX 18 0.281 /var/nv-tensorrt-local-repo-ubuntu1804-8.5.1-cuda-10.2/python3-libnvinfer_8.5.1-1+cuda10.2_amd64.deb
# #18 XXX 0.281 /var/nv-tensorrt-local-repo-ubuntu1804-8.5.1-cuda-10.2/tensorrt-dev_8.5.1.7-1+cuda10.2_amd64.deb
# #18 XXX 0.281 /var/nv-tensorrt-local-repo-ubuntu1804-8.5.1-cuda-10.2/tensorrt-libs_8.5.1.7-1+cuda10.2_amd64.deb
# #18 0.281 /var/nv-tensorrt-local-repo-ubuntu1804-8.5.1-cuda-10.2/tensorrt_8.5.1.7-1+cuda10.2_amd64.deb
# #18 0.281 /var/nv-tensorrt-local-repo-ubuntu1804-8.5.1-cuda-10.2/uff-converter-tf_8.5.1-1+cuda10.2_amd64.deb

# # RUN dpkg -i $(find /var/nv-tensorrt-local-repo-${os}-${tag}/ -maxdepth 1 -type f -name "*.deb" | sort | xargs) ;

# RUN apt-get update \
#     && apt-get install -q -y \
#     --no-install-recommends \
#         qt5-default \
#     && apt-get clean -q -y \
#     && apt-get autoremove -q -y \
#     && rm -rf /var/lib/apt/lists/*

# To avoid problem: 
# invoke-rc.d: could not determine current runlevel


COPY ./pal .
ENV DEBIAN_FRONTEND noninteractive
RUN pip install openvino #[onnx,pytorch]==2022.1.0
ENV LD_LIBRARY_PATH=/opt/intel/openvino_2022.1.0.643/runtime/lib/intel64/:/opt/intel/openvino_2022.1.0.643/runtime/3rdparty/tbb/lib/:$LD_LIBRARY_PATH


# RUN yes | ./pal

# currently get error:
# The following packages have unmet dependencies:
#  pal : Depends: openvino-2022.1.0 but it is not installable
# E: Unable to correct problems, you have held broken packages.
# The command '/bin/sh -c ./pal' returned a non-zero code: 100



# RUN apt-get update \
#     && apt-get install -q -y \
#     --no-install-recommends \
#     && apt-get clean -q -y \
#     && apt-get autoremove -q -y \
#     && rm -rf /var/lib/apt/lists/*
# RUN ./pal

# CMD find / -maxdepth 8 -type d -name "DreamVu" | sort

# CMD DreamVu/PAL/Explorer/x86_64/Explorer

# RUN apt install --fix-broken


# RUN apt-get update \
#     && apt-get install -q -y \
#     --no-install-recommends \
#             $(find /var/nv-tensorrt-local-repo-${os}-${tag}/ -maxdepth 1 -type f -name "*.deb" | xargs) \
#     && apt-get clean -q -y \
#     && apt-get autoremove -q -y \
#     && rm -rf /var/lib/apt/lists/*
# CMD dpkg -l | grep TensorRT
# CMD sleep infinity
