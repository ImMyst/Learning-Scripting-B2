 #!/bin/bash

mkdir tmp/$0
cd tmp/$0

echo "Le répértoire courant est  $(pwd)"

mkdir {A..J}
touch A/{01..05}

for i in {B..J}
do
  cp A/* ${i}
done

tree */

for i in {A..J}
do
  echo "Ce fichier est le 01 " >> ${i}/01
done


