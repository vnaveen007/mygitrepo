FROM nginx:alpine
COPY ./site /usr/share/nginx/html
EXPOSE 80
#WORKDIR /opt
#ENTRYPOINT ["python","app.py"]
