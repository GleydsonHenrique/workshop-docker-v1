# TODO 1 — Imagem base
# Defina a imagem oficial do Apache na versão 2.4. httpd:2.4

###### FROM ______
FROM httpd:2.4

# TODO 2 — Metadados (opcional, mas boa prática)
# Adicione um LABEL identificando a imagem.

###### LABEL org.opencontainers.image.title=""
###### LABEL org.opencontainers.image.description=""

LABEL org.opencontainers.image.title="Workshop Docker"
LABEL org.opencontainers.image.description="Landing page do workshop servida pelo Apache"


# TODO 3 — Copiar o site para dentro da imagem
# Copie TODO o conteúdo da pasta ./site para o diretório em que
# o Apache procura os arquivos a serem servidos.
###### COPY ______ /usr/local/apache2/htdocs/
COPY ./site/ /usr/local/apache2/htdocs/

# TODO 4 — Documentar a porta (opcional)
# Informe qual porta o container expõe.
######  EXPOSE ______
EXPOSE 80

# Pronto! Depois de preencher, construa e rode:
#   docker build -t workshop-apache .
#   docker run -d -p 8080:80 workshop-apache
