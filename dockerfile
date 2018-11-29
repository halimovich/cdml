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
