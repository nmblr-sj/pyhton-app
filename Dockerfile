FROM python:3.10-alpine

COPY requirements.txt /tmp

RUN pip install -r /tmp/requirements.txt

COPY src /src

CMD python /src/app.py

# docker build -t python-app:v1 .
# docker run -p 8080:5000  python-app:v1
# docker tag python-app:v1 amihanglobal/python-app:v1
# docker push amihanglobal/python-app:v1
# docker tag python-app:v2 amihanglobal/python-app:v2
# docker push amihanglobal/python-app:v2
