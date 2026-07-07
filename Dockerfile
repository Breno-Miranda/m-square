# Dockerfile para m-square (Static Site)
FROM node:20-alpine

# Define o diretório de trabalho
WORKDIR /app

# Instala o pacote serve globalmente para servir os arquivos estáticos
RUN npm install -g serve

# Copia todos os arquivos do site para o container
COPY . .

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:8080 || exit 1

CMD ["serve", "-s", ".", "-p", "8080"]
