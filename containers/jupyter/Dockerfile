# --------------------------------------------------------------------------------------------
# Jupyter image recipe for FATES tutorial notebooks
#
# Note that the offical Jupyter stacks are available on quay.io, not docker hub
# --------------------------------------------------------------------------------------------

FROM quay.io/jupyter/datascience-notebook:lab-4.0.10

LABEL maintainer.name="Gregory Lemieux" \
      maintainer.email="glemieux@lbl.gov" \
      author.name="Gregory Lemieux" \
      author.email="glemieux@lbl.gov" \
      description="FATES tutorial Jupyter Lab base image"

# Github repo raw url
ENV TUTORIAL_URL=https://raw.githubusercontent.com/NGEET/fates-tutorial

# Install additional packages
# Run in debug mode and stop if non-zero status returned
RUN echo "Installing additional conda packages"
RUN set -ex \
    && conda install -q -y xarray \
    # clean up post install
    && conda clean --all -f -y \
    # use jupyter supplied script to git user read-write
    && fix-permissions "${CONDA_DIR}"

# Setup local directory structure.  Notebooks will be held in top of home directory.
RUN mkdir "/home/${NB_USER}/scripts" \
    && mkdir "/home/${NB_USER}/notebooks" \
    && mkdir "/home/${NB_USER}/inputdata" \
    && mkdir "/home/${NB_USER}/output" \
    && fix-permissions "/home/${NB_USER}/scripts" \
    && fix-permissions "/home/${NB_USER}/notebooks" \
    && fix-permissions "/home/${NB_USER}/inputdata" \
    && fix-permissions "/home/${NB_USER}/output" \
    && fix-permissions "/home/${NB_USER}"

# Get other tools as necessary.  Permission for the directory structure must be conducted prior to this.
RUN echo "Installing ctsm_py tooling"
RUN cd /home/${NB_USER} \
    && git -c http.sslVerify=false clone --single-branch https://github.com/NCAR/ctsm_python_gallery.git \
    && conda init -q --all \
    && cd ctsm_python_gallery \
    && pip install -e .

# Get the jupyter notebooks
# RUN cd /home/${NB_USER}/notebooks/ \
    # && wget -r -l1 --no-parent -A.ipynb $TUTORIAL_URL/main/fates-tutorial-jupyter-book/
# Use COPY until repository is public
RUN cd /home/${NB_USER}/notebooks
COPY fates-tutorial-jupyter-book .

# Setup default user when entering
USER ${NB_UID}
WORKDIR ${HOME}

# EOF
