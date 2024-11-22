# FlutFlix

Projeto de app em Dart/Flutter para indicação de filmes usando TMDB e MovieLens.

## Rodando o Servidor

Os códigos abaixo funcionam para máquinas Linux

1 - Iniciar TensorFlow Serving:

sudo docker run -t --rm -p 8501:8501 -p 8500:8500 -v "$(pwd)/:/models/" tensorflow/serving --model_config_file=/models/models.config

A resposta vai ser algo como:

[warn] getaddrinfo: address family for nodename not supported
2022-04-24 09:32:06.785748: I tensorflow_serving/model_servers/server.cc:414] Exporting HTTP/REST API at:localhost:8501 ...
[evhttp_server.cc : 245] NET_LOG: Entering the event loop ...


--------------------------

2 - Iniciar o Flask service:


sudo FLASK_APP=recommender.py FLASK_ENV=development flask run


A resposta vai ser algo como:

 * Serving Flask app 'recommender.py' (lazy loading)
 * Environment: development
 * Debug mode: on
 * Running on http://127.0.0.1:5000/ (Press CTRL+C to quit)
 * Restarting with stat
 * Debugger is active!
 * Debugger PIN: 705-382-264
127.0.0.1 - - [25/Apr/2022 19:44:47] "POST /recommend HTTP/1.1" 200 -


--------------------------

3 - Comando teste para retorno do backend:

curl -X POST -H "Content-Type: application/json" -d '{"user_id":"42"}' http://localhost:5000/recommend

--------------------------

4 - Inicie o aplicativo

Na raiz do aplicativo rode o comando:

flutter run
