#!/bin/bash
LOCATION=$PWD

declare -a exercises=("0-create-new-app" "1-create-component" "2-dynamic-data" "3-classes-and-styles" "4-events" "5-forms" "6-use-api" "7-component-tree" "8-component-communication" "9-global-store" "10-slots")

for i in "${exercises[@]}"
do
   SOLUTION="$LOCATION/exercises/$i/solution"
   TEMPLATE="$LOCATION/exercises/$i/template"
   cd $SOLUTION
   npm install
   cd $TEMPLATE
   npm install
done
