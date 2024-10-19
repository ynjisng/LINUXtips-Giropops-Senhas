FROM alpine:latest

RUN apt-get update && apt-get install -y pip redis
RUN git clone https://github.com/badtuxx/giropops-senhas.git && cd giropops-senhas

RUN pip install --no-cache-dir -r requirements.txt

RUN systemctl start redis
ENV REDIS_HOST=localhost

ENTRYPOINT ["flask"]
CMD ["run", "--host=0.0.0.0"]
