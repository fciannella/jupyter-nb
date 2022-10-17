FROM arm64v8/python
RUN chmod 1777 /tmp

WORKDIR /app
RUN apt-get update
#RUN apt-get install -y python3-dev build-essential lsb-release libffi-dev libxml2-dev libxslt-dev
RUN apt-get install -y python3-setuptools rustc cmake

ENV APP_HOME=/app
ENV PYTHONPATH=/app
ENV PORT=8888

COPY language-tutor-52cbe-b334e63f4021.json /app
ENV GOOGLE_APPLICATION_CREDENTIALS=/app/language-tutor-52cbe-b334e63f4021.json

COPY requirements.txt /app

RUN pip3 install -r requirements.txt

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - &&\
    apt install -y nodejs
RUN jupyter labextension install @jupyterlab/debugger
RUN mkdir -p /app/notebooks
#RUN pip3 install --upgrade google-auth
ENTRYPOINT jupyter-lab --ip=0.0.0.0 --port=8888 --no-browser --NotebookApp.token='admin' --allow-root --notebook-dir=/app/notebooks
