#FROM python:3.8-slim-buster
FROM python:3.9-slim
WORKDIR /app
#COPY . /app
COPY . .
# Install additional system dependencies
RUN apt-get update && apt-get install -y libgomp1
RUN pip install --upgrade pip
# RUN pip install --trusted-host pypi.python.org --requirement requirements.txt
RUN apt update -y && apt install awscli -y
RUN apt-get update && apt-get install ffmpeg libsm6 libxext6 unzip -y && pip install -r requirements.txt
#EXPOSE 8080
CMD ["uvicorn", "api:app", "--host", "0.0.0.0", "--port", "8080"]
#CMD ["python3", "app.py"]

#EXPOSE 5000
#CMD ["python", "main.py"]
# sudo docker build -t hello_world . # this to build our docker image
# sudo docker run -d -p 8080:5000 hello_world:latest # this to run the latest image and create our docker
# finally go : http://127.0.0.1:8080/ and see the result


