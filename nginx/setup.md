# Setup 123ngon.xyz

## 1. DNS

A todo 170.64.174.57
A node 170.64.174.57

## 2. Start Nginx Proxy Manager

```bash
mkdir -p ~/nginx-proxy-manager
cd ~/nginx-proxy-manager
nano docker-compose.yml
docker compose up -d
docker ps
```

## 3. Login

```txt
http://170.64.174.57:81
admin@example.com
changeme
```

## 4. Proxy Host Frontend

```txt
Domain Names: todo.123ngon.xyz
Scheme: http
Forward Hostname/IP: 170.64.174.57
Forward Port: 3000
Websockets Support: ON
Block Common Exploits: ON
SSL: Request new SSL Certificate
Force SSL: ON
HTTP/2 Support: ON
```

## 5. Proxy Host Backend

```txt
Domain Names: node.123ngon.xyz
Scheme: http
Forward Hostname/IP: 170.64.174.57
Forward Port: 8000
Websockets Support: ON
Block Common Exploits: ON
SSL: Request new SSL Certificate
Force SSL: ON
HTTP/2 Support: ON
```

## 6. Frontend ENV

React:

```env
REACT_APP_API_URL=https://node.123ngon.xyz
```

Vite:

```env
VITE_API_URL=https://node.123ngon.xyz
```

## 7. Restart app

```bash
docker restart nern-app-todo-frontend-1
docker restart nern-app-todo-backend-1
```

## 8. Test

```txt
https://todo.123ngon.xyz
https://node.123ngon.xyz
```
