# ✅ Solução de referência

> Tente resolver sozinho antes de consultar esta página.

## `Dockerfile` completo

```dockerfile
# Imagem base: Apache HTTP Server oficial, versão 2.4
FROM httpd:2.4

# Metadados da imagem (boa prática)
LABEL org.opencontainers.image.title="Workshop Docker Apache - Hub4IT"
LABEL org.opencontainers.image.description="Landing page do workshop servida pelo Apache"

# Copia o conteúdo da pasta ./site para o diretório que o Apache serve
COPY ./site/ /usr/local/apache2/htdocs/

# Documenta a porta padrão do Apache
EXPOSE 80
```

## Por que funciona

| Instrução | O que faz |
|---|---|
| `FROM httpd:2.4` | Parte de uma imagem que **já tem o Apache instalado e configurado**. |
| `COPY ./site/ /usr/local/apache2/htdocs/` | Coloca os arquivos do site exatamente onde o Apache procura o que servir. |
| `EXPOSE 80` | Documenta que o container escuta na porta 80 (informativo; não publica a porta sozinho). |

> **E o `CMD`?** A imagem `httpd` já define o comando que inicia o Apache
> (`httpd-foreground`). Por isso não precisamos declarar `CMD` — se declarássemos,
> estaríamos sobrescrevendo o comportamento padrão.

## Construir e rodar

```bash
docker build -t workshop-apache .
docker run -d -p 8080:80 workshop-apache
```

Abra a porta **8080** na aba **Ports** do Codespaces.

## 🔎 Verificação rápida

```bash
# O container deve aparecer como "Up"
docker ps

# Deve retornar HTTP/1.1 200 OK
curl -I http://localhost:8080
```

---

## 💡 Desafios extras (para turmas mais avançadas)

1. **Build multi-stage / imagem menor:** troque a base por `httpd:2.4-alpine` e
   compare o tamanho com `docker images`.
2. **Porta customizada:** altere o `httpd.conf` para o Apache escutar em outra porta
   e ajuste o `EXPOSE` e o `-p`.
3. **Healthcheck:** adicione uma instrução `HEALTHCHECK` que faça `curl` na própria página.
4. **`.dockerignore`:** experimente adicionar arquivos à raiz e observe o que entra
   (ou não) na imagem.
