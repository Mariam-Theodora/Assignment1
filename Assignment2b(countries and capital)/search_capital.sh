#!/bin/bash

# Define an associative array to store countries and capitals
declare -A countries_capitals=(
    ["Argentina"]="Buenos Aires"
    ["Brazil"]="Brasilia"
    ["Canada"]="Ottawa"
    ["France"]="Paris"
    ["Germany"]="Berlin"
    ["India"]="New Delhi"
    ["Japan"]="Tokyo"
    ["United Kingdom"]="London"
    ["United States"]="Washington, D.C."
)

# Function to sort the list by capital city
sort_by_capital() {
    for capital in $(echo "${countries_capitals[*]}" | tr ' ' '\n' | sort); do
        for country in "${!countries_capitals[@]}"; do
            if [[ "${countries_capitals[$country]}" == "$capital" ]]; then
                echo "$country - $capital"
                break
            fi
        done
    done
}

# Sort the list by capital city
sort_by_capital
