#!/bin/bash
docker compose --env-file .env.development -f docker-compose-dev.yml down
docker compose --env-file .env.development -f docker-compose-dev.yml up