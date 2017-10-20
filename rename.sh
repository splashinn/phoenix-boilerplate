#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo "Project name can't be empty"
    exit 1
fi

project="$1"

mv "src/lib/web_app.ex" "src/lib/${project}.ex";
mv "src/lib/web_app_web.ex" "src/lib/${project}_web.ex";
mv "src/lib/web_app" "src/lib/${project}";
mv "src/lib/web_app_web" "src/lib/${project}_web";

IFS='_' read -r -a array <<< "$project"

pascalProject=""
for element in "${array[@]}"
do
    element="$(tr '[:lower:]' '[:upper:]' <<< ${element:0:1})${element:1}"
    pascalProject="${pascalProject}${element}"
done

LC_ALL=C find ./src -type f -exec sed -i '' -e "s/web_app/${project}/" {} \;
LC_ALL=C find ./src -type f -exec sed -i '' -e "s/WebApp/${pascalProject}/" {} \;