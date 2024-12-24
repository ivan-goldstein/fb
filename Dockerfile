FROM python:3.13-alpine

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

USER nobody:nobody

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
