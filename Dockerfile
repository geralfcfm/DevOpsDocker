
FROM jupyter/datascience-notebook
USER root
RUN apt update
RUN apt install -y git wget
USER $NB_UID
RUN pip install numpy
RUN pip install pandas
RUN pip install matplotlib
RUN pip install seaborn
RUN mkdir -p /home/jovyan/.jupyter/ && \
    echo "c.NotebookApp.token = ''" > /home/jovyan/.jupyter/jupyter_notebook_config.py && \
    echo "c.NotebookApp.password = ''" >> /home/jovyan/.jupyter/jupyter_notebook_config.py && \
    echo "c.NotebookApp.open_browser = False" >> /home/jovyan/.jupyter/jupyter_notebook_config.py && \
    echo "c.NotebookApp.ip = '0.0.0.0'" >> /home/jovyan/.jupyter/jupyter_notebook_config.py
RUN chown -R $NB_UID /home/jovyan/.jupyter/
