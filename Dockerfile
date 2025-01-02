# Use a última imagem oficial do Python
FROM python:latest

# Atualiza o sistema e instala dependências necessárias
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    wget \
    unzip \
    tar \
    libnss3 \
    libgconf-2-4 \
    libx11-6 \
    libx11-xcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxi6 \
    libxtst6 \
    libxrandr2 \
    libasound2 \
    libpango1.0-0 \
    libatk1.0-0 \
    libcups2 \
    libxss1 \
    libgbm1 \
    libglib2.0-0 \
    libgtk-3-0 \
    libdbus-glib-1-2 \
    && rm -rf /var/lib/apt/lists/*

# Define o diretório de trabalho
WORKDIR /app

# Instala o Robot Framework, SeleniumLibrary e Requests
RUN pip install --no-cache-dir robotframework robotframework-seleniumlibrary requests

# Instala o ChromeDriver
RUN wget -O /tmp/chromedriver.zip https://storage.googleapis.com/chrome-for-testing-public/131.0.6778.204/linux64/chromedriver-linux64.zip \
    && unzip /tmp/chromedriver.zip -d /tmp/ \
    && mv /tmp/chromedriver-linux64/chromedriver /usr/local/bin/ \
    && rm -rf /tmp/chromedriver.zip /tmp/chromedriver-linux64

# Instala o Geckodriver
RUN wget -O /tmp/geckodriver.tar.gz https://github.com/mozilla/geckodriver/releases/download/v0.35.0/geckodriver-v0.35.0-linux64.tar.gz \
    && tar -xzf /tmp/geckodriver.tar.gz -C /usr/local/bin/ \
    && rm /tmp/geckodriver.tar.gz

# Adiciona /usr/local/bin ao PATH
ENV PATH="/usr/local/bin:${PATH}"

# Copia os testes para o diretório de trabalho
COPY tests/ /usr/src/app/tests

# Valida as instalações
RUN python --version
RUN ls -l /usr/local/bin
RUN which robot
RUN robot --version || true
RUN python -m pip show robotframework-seleniumlibrary
RUN python -m pip show requests
RUN /usr/local/bin/chromedriver --version
RUN geckodriver --version

# Define o comando padrão para o container
CMD ["bash"]
