# 👩‍🏫 Guia do Instrutor — Workshop Docker

Material de apoio para quem conduz o laboratório. Não compartilhe este arquivo
(nem `SOLUCAO.md`) com os alunos antes da atividade, se quiser preservar o desafio.

## 🎯 Objetivo de aprendizagem

Levar o aluno a escrever seu primeiro `Dockerfile` funcional e entender, na prática,
o ciclo **build → run → acesso**, sem precisar instalar nada localmente.

## ⏱️ Duração sugerida

| Bloco | Tempo |
|---|---|
| Conceitos (imagem x container, Dockerfile) | 15–20 min |
| Abrir o Codespaces + explorar o repo | 10 min |
| Resolver o desafio (Dockerfile) | 20–30 min |
| Rodar, testar e discutir erros comuns | 15 min |
| Desafios extras (opcional) | 15 min |

## 🧭 Preparação

1. Crie o repositório a partir deste modelo (**Use this template → Create a new repository**)
   ou faça o upload destes arquivos para um repositório novo.
2. Garanta que o Codespaces esteja habilitado para a organização/turma.
3. (Opcional) Remova `docs/SOLUCAO.md` da branch dos alunos e mantenha numa branch à parte.

## ✅ Resultado esperado

Ao rodar `docker run -d -p 8080:80 workshop-apache` e abrir a porta 8080,
o aluno deve ver a landing page do workshop.

## 🐞 Erros frequentes e como conduzir

| Sintoma | Causa provável | Como orientar |
|---|---|---|
| `docker build` falha logo no início | `FROM` não preenchido | Relembrar que todo Dockerfile começa pela imagem base. |
| Build passa, mas a página fica "Not Found" | Caminho errado no `COPY` | Reforçar o destino `/usr/local/apache2/htdocs/`. |
| Porta 8080 não abre | Esqueceu `-p 8080:80` ou o container não subiu | `docker ps` para checar; revisar o mapeamento de portas. |
| Alterou o site e "não mudou" | Não reconstruiu a imagem | Explicar que a imagem é imutável; é preciso novo `build`. |

## 💬 Perguntas para fechar a discussão

- Qual a diferença entre **imagem** e **container**?
- Por que não precisamos de um `CMD` neste Dockerfile?
- O que o `-p 8080:80` realmente faz?
- O que mudaria se usássemos `httpd:2.4-alpine`?

## 📌 Observação

Este material é um rascunho de treinamento. Antes de aplicar com um cliente,
recomenda-se revisão com o time técnico e comercial da Hub4IT.
