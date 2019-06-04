all : setup delete_routes 
	
setup: 
	docker-compose up -d
clean:
	docker network prune
	docker-compose down

delete_routes:
	docker exec -it tp6_host1_1 ip route del default;
	docker exec -it tp6_host1_1 ip route add default via 200.17.19.2;
	docker exec -it tp6_dns_server_1 route del default;
	docker exec -it tp6_dns_server_1 route add default gw 200.17.18.2;
	echo "Docker compose up finalizado!!!!!"