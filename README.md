# M-Square

Site estático para assistir múltiplas streams, lives e vídeos simultaneamente em uma grade personalizável. O projeto suporta links do YouTube e Kick, compartilhamento de grade, modo cinema e páginas temáticas.

## Rotas

| Rota | Descrição |
| --- | --- |
| `/` | Grade principal multi-stream. |
| `/cinema/` | Player em modo cinema para um vídeo único. Aceita `?v=YOUTUBE_ID`. |
| `/flamengo/` | Página temática com vídeos históricos do Flamengo. |
| `/copa/` | Página visual do Copão. |
| `/copa/online.json` | Endpoint JSON com o link atual do Copão. |

Endpoint público do Copão:

```text
https://m-square.mirandasoft.com.br/copa/online.json
```

Formato atual:

```json
{
  "title": "Copao",
  "videoUrl": "https://www.youtube.com/watch?v=nLFPUeA-Naw",
  "playbackMode": "external",
  "embedAllowed": false,
  "refreshSeconds": 30,
  "links": [
    {
      "title": "Copao - YouTube",
      "type": "youtube",
      "url": "https://www.youtube.com/watch?v=nLFPUeA-Naw"
    }
  ],
  "updatedAt": "2026-06-22"
}
```

## Estrutura

```text
.
├── index.html
├── style.css
├── cinema/
├── copa/
│   ├── index.html
│   ├── copa.css
│   └── online.json
├── flamengo/
├── robots.txt
└── sitemap.xml
```

## Rodar Localmente

Este é um projeto estático, sem build obrigatório.

```sh
python3 -m http.server 8787 --bind 127.0.0.1
```

Acesse:

```text
http://127.0.0.1:8787/
http://127.0.0.1:8787/copa/online.json
```

## Editar o Vídeo do Copão

Atualize [copa/online.json](copa/online.json) alterando `videoUrl` e, se necessário, o item em `links`.

Se o YouTube bloquear incorporação, mantenha `playbackMode` como `external` e `embedAllowed` como `false`.

Se a página visual também precisar refletir o mesmo vídeo, atualize o ID do YouTube em [copa/index.html](copa/index.html).

## Publicação

As páginas são arquivos estáticos. Para publicar:

```sh
git add .
git commit -m "Describe change"
git push origin main
```

Depois do deploy, confirme:

```text
https://m-square.mirandasoft.com.br/copa/online.json
```
