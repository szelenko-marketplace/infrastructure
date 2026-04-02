#!/bin/bash

read -p "Enter new project alias: " PROJECT_ALIAS
PROJECT_ALIAS_UC="${PROJECT_ALIAS^}"

read -e -p "Confirm project path: " -i "$PWD/$PROJECT_ALIAS" PROJECT_PATH
mkdir -p "$PROJECT_PATH"
tar xf ./php-service.tar.gz -C "$PROJECT_PATH" --strip-components=1

read -e -p "Enter xdebug port number: " -i "9003" XDEBUG_PORT
read -e -p "Enter xdebug IDE Key: " -i "PHPSTORM" XDEBUG_IDE_KEY

read -e -p "Enter external Postgres port number: " -i "32001" POSTGRES_PORT
read -e -p "Postgres Data path: " -i "$PWD/$PROJECT_ALIAS/data/postgres" POSTGRES_PATH
mkdir -p $POSTGRES_PATH

sed -i "s@~PROJECT_ALIAS~@$PROJECT_ALIAS@g" "$PROJECT_PATH/README.md"

sed -i "s@~PROJECT_ALIAS~@$PROJECT_ALIAS@g" "$PROJECT_PATH/values.yaml.dist"
sed -i "s@~PROJECT_PATH~@$PROJECT_PATH@g" "$PROJECT_PATH/values.yaml.dist"
sed -i "s@~XDEBUG_PORT~@$XDEBUG_PORT@g" "$PROJECT_PATH/values.yaml.dist"
sed -i "s@~XDEBUG_IDE_KEY~@$XDEBUG_IDE_KEY@g" "$PROJECT_PATH/values.yaml.dist"
sed -i "s@~POSTGRES_PORT~@$POSTGRES_PORT@g" "$PROJECT_PATH/values.yaml.dist"
sed -i "s@~POSTGRES_DATA~@$POSTGRES_PATH@g" "$PROJECT_PATH/values.yaml.dist"
cp "$PROJECT_PATH/values.yaml.dist" "$PROJECT_PATH/values.yaml"

sed -i "s@~PROJECT_ALIAS~@$PROJECT_ALIAS@g" "$PROJECT_PATH/.env"

sed -i "s@~PROJECT_ALIAS~@$PROJECT_ALIAS_UC@g" "$PROJECT_PATH/config/packages/api_platform.yaml"

# docker build --build-arg INSTALL_XDEBUG=1 -t localhost:32000/$PROJECT_ALIAS:latest "$PROJECT_PATH/kube"
# docker push localhost:32000/$PROJECT_ALIAS:latest

