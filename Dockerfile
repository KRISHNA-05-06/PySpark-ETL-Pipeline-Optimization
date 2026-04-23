FROM python:3.11-slim

ENV DEBIAN_FRONTEND=noninteractive
ENV PYSPARK_PYTHON=python3
ENV PYSPARK_DRIVER_PYTHON=python3

RUN apt-get update && apt-get install -y \
    default-jdk \
    procps \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Set JAVA_HOME automatically
ENV JAVA_HOME=/usr/lib/jvm/default-java

WORKDIR /tutorials/pyspark-optimization-tutorial

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 4040

CMD ["/bin/bash"]