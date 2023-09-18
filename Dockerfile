FROM python:3.9.7-slim-buster
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y git curl python3-pip ffmpeg  # Added -y flag to automatically answer "yes" to installation prompt
RUN pip3 install -U pip
RUN python3 -m pip install --upgrade pip
COPY . /app/
WORKDIR /app/
RUN pip3 install -U -r requirements.txt
EXPOSE 8080/tcp   # Added /tcp to specify that the exposed port is TCP
CMD ["bash","start.sh"]
