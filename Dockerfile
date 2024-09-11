
FROM jupyter/datascience-notebook
USER root
RUN apt update
RUN apt install -y git wget
USER $NB_UID
RUN pip install numpy
RUN pip install pandas
RUN pip install matplotlib
RUN pip install seaborn
EXPOSE 8888
CMD ["start-notebook.sh"]
