FROM continuumio/anaconda3
# Upgrqde pip
RUN pip install --upgrade pip
# Install msgpack
RUN pip install msgpack
# install git
RUN apt-get  -y update && \
    apt-get  -y upgrade && \
    apt-get install -y git
# install nodejs
RUN conda install -c conda-forge nodejs
# upgrade jupyterlab
RUN pip install jupyterlab --upgrade
# install jupyterlab-git 
RUN jupyter labextension install @jupyterlab/git
# install nbdime
RUN pip install nbdime
# install DVC
RUN pip install dvc
# Create workdir
RUN mkdir -p /mydir/data
WORKDIR /mydir
# Initialise git
RUN git config --global user.email "takeshik@gmail.com"
RUN git config --global user.name "Takeshi Kovacs"
# init git/DVC 
RUN git init
RUN dvc init
RUN git commit -m 'initialize DVC'
# Expose port 8888 
EXPOSE 8888
#  Launch jupyter lab at docker start
#  ENTRYPOINT ["jupyter", "lab", "--allow-root","--ip=0.0.0.0", "--no-browser"]