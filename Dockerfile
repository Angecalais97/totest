# 1️⃣ Image NGINX officielle (légère et stable)
FROM nginx:alpine

# 2️⃣ Supprimer la config par défaut
RUN rm -rf /usr/share/nginx/html/*

# 3️⃣ Copier les fichiers statiques dans NGINX
COPY index.html /usr/share/nginx/html/
COPY style.css /usr/share/nginx/html/

# 4️⃣ Exposer le port 80
EXPOSE 80

# 5️⃣ Lancer NGINX
CMD ["nginx", "-g", "daemon off;"]
