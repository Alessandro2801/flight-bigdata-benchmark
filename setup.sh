#!/bin/bash

# Configurazione percorsi sicuri
if [ -z "$HADOOP_HOME" ]; then
    export HADOOP_HOME=$HOME/hadoop-3.4.1
fi

if [ -z "$JAVA_HOME" ]; then
    export JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
fi

if [ -z "$ROOT_DIR" ]; then
    export ROOT_DIR=$(pwd)
fi

# Ferma istanze attive
$HADOOP_HOME/sbin/stop-dfs.sh

# Pulizia sicura (solo file Hadoop)
rm -rf /tmp/hadoop-*
rm -rf /tmp/hsperfdata_*

# Formatta e avvia
$HADOOP_HOME/bin/hdfs namenode -format -force
$HADOOP_HOME/sbin/start-dfs.sh