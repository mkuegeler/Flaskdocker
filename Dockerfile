# Docker 17.05 added support for multistage builds. 
# This means that dependencies can be built in one image and then imported into another. 
# Rewriting our Dockerfile to use multistage builds now looks like:
FROM python:3.6-alpine as base
FROM base as builder
RUN mkdir /install
WORKDIR /install
COPY requirements.txt /requirements.txt
RUN pip install --install-option="--prefix=/install" -r /requirements.txt
FROM base
COPY --from=builder /install /usr/local
# COPY src /app
# add custom application files
# copy server.py, static html
COPY ./server.py server.py
COPY ./admin.py admin.py
COPY ./static static


EXPOSE 5000

ENTRYPOINT ["python3","server.py"]