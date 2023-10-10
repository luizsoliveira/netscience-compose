#!/bin/bash
docker compose --env-file .env.production -f docker-compose-prod.yml down
docker compose --env-file .env.production -f docker-compose-prod.yml build react-admin --no-cache
docker compose --env-file .env.production -f docker-compose-prod.yml up