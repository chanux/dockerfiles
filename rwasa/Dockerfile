FROM scratch
COPY root /
COPY bin/rwasa /
EXPOSE 80
ENTRYPOINT ["/rwasa"]
CMD ["-bind", "80", "-sandbox", "/var/www", "-foreground"]
