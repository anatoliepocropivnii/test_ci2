ADD file:5d68d27cc15a80653c93d3a0b262a28112d47a46326ff5fc2dfbf7fa3b9a0ce8 in / 
CMD ["bash"]
ARG DEBIAN_FRONTEND=noninteractive 
|1 DEBIAN_FRONTEND=noninteractive /bin/sh -c :   && apt-get update   && apt-get install -y     apt-utils     bison     ca-certificates     ccache     check     curl     flex     git     gperf     lcov     libffi-dev     libncurses-dev     libpython2.7     libusb-1.0-0-dev     make     ninja-build     python3     python3-pip     unzip     wget     xz-utils     zip   && apt-get autoremove -y   && rm -rf /var/lib/apt/lists/*   && update-alternatives --install /usr/bin/python python /usr/bin/python3 10   && python -m pip install --upgrade     pip     virtualenv   && :
ARG IDF_CLONE_URL=https://github.com/onedometic/esp-idf/esp-idf.git
ARG IDF_CLONE_BRANCH_OR_TAG=master
ARG IDF_CHECKOUT_REF=
ENV IDF_PATH=/opt/esp/idf
ENV IDF_TOOLS_PATH=/opt/esp
|4 DEBIAN_FRONTEND=noninteractive IDF_CHECKOUT_REF=5624dffc52271389376352974ba5911963ee207b IDF_CLONE_BRANCH_OR_TAG=master IDF_CLONE_URL=https://github.com/espressif/esp-idf.git /bin/sh -c echo IDF_CHECKOUT_REF=$IDF_CHECKOUT_REF IDF_CLONE_BRANCH_OR_TAG=$IDF_CLONE_BRANCH_OR_TAG &&     git clone --recursive       ${IDF_CLONE_BRANCH_OR_TAG:+-b $IDF_CLONE_BRANCH_OR_TAG}       $IDF_CLONE_URL $IDF_PATH &&     if [ -n "$IDF_CHECKOUT_REF" ]; then       cd $IDF_PATH &&       git checkout $IDF_CHECKOUT_REF &&       git submodule update --init --recursive;     fi
|4 DEBIAN_FRONTEND=noninteractive IDF_CHECKOUT_REF=5624dffc52271389376352974ba5911963ee207b IDF_CLONE_BRANCH_OR_TAG=master IDF_CLONE_URL=https://github.com/espressif/esp-idf.git /bin/sh -c :   && update-ca-certificates --fresh   && $IDF_PATH/tools/idf_tools.py --non-interactive install required   && $IDF_PATH/tools/idf_tools.py --non-interactive install cmake   && $IDF_PATH/tools/idf_tools.py --non-interactive install-python-env   && rm -rf $IDF_TOOLS_PATH/dist   && :
ENV IDF_CCACHE_ENABLE=1
COPY entrypoint.sh  in /opt/esp/entrypoint.sh
ENTRYPOINT ["/opt/esp/entrypoint.sh"] 
CMD ["/bin/bash"]
