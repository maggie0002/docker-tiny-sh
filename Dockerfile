FROM python:3.10.2-alpine3.15 as tiny-sh

RUN apk add binutils git rsync --no-cache

RUN pip install git+https://github.com/larsks/dockerize.git@024b1a2b463e3244fc2ca3117b29c6ce6309b87c

RUN dockerize -n -o /app/ -a $(which sh) $(which sh)

FROM scratch

COPY --from=tiny-sh /app .
COPY start.sh .

CMD ["sh", "start.sh"]
