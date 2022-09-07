FROM public.ecr.aws/nginx/nginx:mainline
EXPOSE 80
COPY src/index.html /usr/share/nginx/html
