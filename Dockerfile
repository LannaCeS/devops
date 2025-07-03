FROM python:3.13.5-alpine3.22 

#em qual diretório está a aplicação dentro do contêiner
WORKDIR /app

#no cache faz com que só o que está abaixo dele seja refeito a cada inicialização
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt 

#copia o código da aplicação pro diretório de trabalho -> '.' = todo o código
COPY . .

#mapeamento da porta do Docker para porta externa -> 8000 é padrão
EXPOSE 8000

#comando para rodar usando uvicorn e o host 0.0.0.0 torna a aplicação acessível fora do contêiner
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]

#Dockercompose: mais robusto, pipeline, para mais contêineres, para mais de uma imagem

#Comandos
#No comando de execução:
#docker build -t imersao-devops .
# -t = tag, cria nome para imagem
# . = está criando no root do projeto

#docker images -> display da API com suas informações

#mapeamento porta aplicação-contêiner
#docker run -p 8000:8000 imersao-devops -> estava em http://localhost:8000/docs

