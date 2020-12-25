#!/bin/bash                                                                                              
# Author: TahLaMaladie                                                                                   
# Description: This script download/update alt:V server files and check if start.sh is missing.          
# Dependencies: coreutils, wget, >=jq_1.4, pcregrep                                                      

echo "                                                                                                   
    Copyright (C) 2020  TahLaMaladie                                                                     
                                                                                                         
    This program is free software: you can redistribute it and/or modify                                 
    it under the terms of the GNU General Public License as published by                                 
    the Free Software Foundation, either version 3 of the License, or                                    
    (at your option) any later version.                                                                  
                                                                                                         
    This program is distributed in the hope that it will be useful,                                      
    but WITHOUT ANY WARRANTY; without even the implied warranty of                                       
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the                                        
    GNU General Public License for more details.                                                         
"

folder="new_server"
if [ -d "$folder" ]; then
    folder="new_server_$(date +%T)"
fi

mkdir $folder && cd $folder

wget -O 'update.sh' 'https://raw.githubusercontent.com/Lhoerion/altv-serverupdater/master/update.sh'
chmod +x update.sh
./update.sh

start="start.sh"
start_path="https://cdn.altv.mp/others/start.sh"
if [ ! -f "$start" ]; then
    echo -e "$(date +%T) \033[1m /!\ $start is missing. \033[0m"
    wget -O 'start.sh' "$start_path"
    chmod +x start.sh
fi

echo -e "$(date +%T) \033[1m Your server should work when you run: \033[0m"
echo -e "$(date +%T) \033[1m cd $folder && ./start.sh \033[0m"
