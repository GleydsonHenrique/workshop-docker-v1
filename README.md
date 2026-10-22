# 🐳 Workshop Docker — do Dockerfile ao Container Apache

Repositório-modelo do laboratório prático de Docker do **Helionelys**.

Seu objetivo é simples: **escrever um `Dockerfile`** que empacote uma landing page
estática em uma imagem com o servidor **Apache (httpd)**, construir essa imagem e
rodar o container. Quando tudo der certo, a página do workshop aparece no navegador. 🎉

Todo o laboratório roda no **GitHub Codespaces** — você não precisa instalar nada na sua máquina.

---

## 🎯 Objetivo

Ao final deste laboratório você será capaz de:

- Escrever um `Dockerfile` do zero;
- Entender o papel da **imagem base** e da instrução `COPY`;
- Construir uma imagem com `docker build`;
- Rodar um container e mapear portas com `docker run -p`.

## 📦 O que já vem pronto

| Caminho | O que é |
|---|---|
| `site/` | A landing page (HTML + CSS). **Não precisa mexer.** |
| `Dockerfile` | O desafio: um esqueleto com `TODO`s para você preencher. |
| `.devcontainer/` | Configuração do Codespaces (Docker já habilitado). |
| `docs/SOLUCAO.md` | A solução de referência — use só se travar! |

## ✅ Pré-requisitos

Nenhum na sua máquina. Só uma conta no GitHub para abrir o Codespaces.

---

## 🚀 Passo a passo

### 1. Abra o repositório no Codespaces

Clique em **`Code` → aba `Codespaces` → `Create codespace on main`**.
Aguarde alguns instantes enquanto o ambiente é preparado (o Docker já vem instalado).

### 2. Complete o `Dockerfile`

Abra o arquivo `Dockerfile` na raiz do projeto e preencha os `TODO`s.

> 💡 **Dicas**
> - A imagem oficial do Apache se chama `httpd` (use a tag `2.4`).
> - O Apache serve os arquivos que estão em `/usr/local/apache2/htdocs/`.
> - Você vai copiar a pasta `./site/` para dentro desse diretório.

### 3. Construa a imagem

No terminal do Codespaces:

```bash
docker build -t workshop-apache .
```

O ponto final (`.`) diz ao Docker para usar o `Dockerfile` da pasta atual.

### 4. Rode o container

```bash
docker run -d -p 8080:80 workshop-apache
```

- `-d` → roda em segundo plano (*detached*);
- `-p 8080:80` → conecta a porta **8080** do Codespaces à porta **80** do Apache.

### 5. Abra a página

Vá até a aba **`Ports`** (ao lado do terminal), encontre a porta **8080** e clique no
ícone de 🌐 (*Open in Browser*). A landing page do workshop deve aparecer.

**Deu certo? Então você acabou de construir e rodar seu primeiro container. 🐳**

---

## 🧰 Comandos úteis

```bash
docker ps                      # lista containers rodando
docker logs <id-do-container>  # mostra os logs do Apache
docker stop <id-do-container>  # para o container
docker images                  # lista as imagens construídas
```

## 🆘 Travou?

A solução completa está em [`docs/SOLUCAO.md`](docs/SOLUCAO.md). Tente sozinho antes de olhar 😉

## ⚠️ Problemas comuns

- **A porta 8080 não abre a página:** confirme que o container está rodando (`docker ps`)
  e que você usou `-p 8080:80` (a porta do Apache por dentro é a **80**).
- **`docker build` falhou:** releia a mensagem de erro — geralmente é um `TODO`
  ainda não preenchido ou um caminho errado no `COPY`.
- **Alterei o site e não mudou:** reconstrua a imagem (`docker build`) e rode um
  container novo. A imagem é uma "fotografia" dos arquivos no momento do build.

---

<div align="center">

**Hub4IT** · Consultoria de TI · Recife/PE
Material de treinamento — uso educacional.

</div>
