FROM python:3.10-slim
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt
CMD ["python", "app.py"]
FROM nginx:alpine
COPY . /usr/share/nginx/html
EXPOSE 80
