FROM ubuntu:latest

# Add labels for better metadata
LABEL maintainer="Xun LI <lixun910@gmail.com>" \
      description="Keplergl-Jupyter notebook test container" \
      version="0.3.5"

# Install system dependencies and clean up in a single RUN command to reduce layers
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    gdal-bin \
    libgdal-dev && \
    rm -rf /var/lib/apt/lists/*

# Create a virtual environment and install Python packages
RUN python3 -m venv /opt/.venv && \
    /opt/.venv/bin/pip install --no-cache-dir \
    geopandas \
    jupyter \
    jupyterlab \
    ipywidgets \
    notebook \
    jupyter_packaging \
    pyarrow \
    setuptools \
    wheel \
    keplergl==0.3.7

# Add a working directory
WORKDIR /notebooks

# Expose the port Jupyter will run on
EXPOSE 8888

# Run jupyter notebook with token exposed in logs
CMD ["bash", "-c", "cd /notebooks && /opt/.venv/bin/jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.log_level='INFO'"]
