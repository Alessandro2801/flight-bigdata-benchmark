#!/bin/bash

# Controllo che siano passati tutti i parametri richiesti
if [ $# -lt 3 ]; then
    echo "Uso:  bash run.sh <script_name> <dataset_tag> <master>"
    echo "Es:   bash run.sh job_1 flights_1 local[*]"
    exit 1
fi

# Rimuove la cartella di output precedente su HDFS se già esistente
hdfs dfs -rm -r -f /user/$USER/spark-sql/$1

export SPARK_HOME=$HOME/spark-3.5.5-bin-hadoop3

if [ "$3" == "local[*]" ]; then
    SPARK_CMD="$SPARK_HOME/bin/spark-submit"
else
    SPARK_CMD="spark-submit"
fi

# MODIFICA: Inseriamo l'host e la porta espliciti (localhost:9000)
$SPARK_CMD \
    --master $3 \
    $1.py \
    -input hdfs://localhost:9000/user/$USER/data/$2.csv \
    -output hdfs://localhost:9000/user/$USER/spark-sql/$1