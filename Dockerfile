FROM tensorflow/tensorflow:latest-gpu

WORKDIR /app

COPY requirements.txt .

ENV PIP_ROOT_USER_ACTION=ignore

RUN pip install --upgrade pip && \
    pip install -r requirements.txt && \
    jupyter server --generate-config && \
    printf "c.ServerApp.token = 'secret'\nc.ServerApp.password = ''\nc.ServerApp.open_browser = False\nc.ServerApp.ip = '0.0.0.0'\nc.ServerApp.port = 8888\n" >> ~/.jupyter/jupyter_server_config.py

EXPOSE 8888

CMD ["jupyter", "server", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
