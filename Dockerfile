FROM tensorflow/tensorflow:latest-gpu

WORKDIR /app

COPY app/pyproject.toml app/poetry.lock* .

RUN pip install --upgrade pip poetry jupyter jupyterlab && \
    poetry config virtualenvs.create false && \
    poetry install --no-root && \
    poetry run jupyter server --generate-config && \
    printf "c.ServerApp.token = 'secret'\nc.ServerApp.password = ''\nc.ServerApp.open_browser = False\nc.ServerApp.ip = '0.0.0.0'\nc.ServerApp.port = 8888\n" >> ~/.jupyter/jupyter_server_config.py

EXPOSE 8888

CMD ["jupyter", "server", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
