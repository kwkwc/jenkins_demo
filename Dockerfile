FROM nginx:1.15.2
ENV REFRESHED_AT 2018-08-09

COPY ./index.html /usr/share/nginx/html/index.html

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
