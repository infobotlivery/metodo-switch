FROM nginx:alpine

# Copiar la landing al directorio público de nginx
COPY index.html /usr/share/nginx/html/index.html

# Configuración nginx optimizada para SPA estática
RUN printf 'server {\n\
    listen 80;\n\
    server_name _;\n\
    root /usr/share/nginx/html;\n\
    index index.html;\n\
    gzip on;\n\
    gzip_types text/html text/css application/javascript;\n\
    add_header Cache-Control "public, max-age=3600";\n\
    location / { try_files $uri $uri/ /index.html; }\n\
}\n' > /etc/nginx/conf.d/default.conf

EXPOSE 80
