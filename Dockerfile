FROM ghcr.io/maggie0002/dockerize as dockerize

RUN dockerize -n -o /app/ -a $(which sh) $(which sh)

FROM scratch

COPY --from=dockerize /app .
COPY start.sh .

CMD ["sh", "start.sh"]
