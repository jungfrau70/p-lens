#Java
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=${JAVA_HOME}/bin:${PATH}

#Python
export PYTHON_HOME=/usr
export PATH=${PYTHON_HOME}/bin:${PATH}

#Spark
export SPARK_LOCAL_IP="127.0.0.1"
export SPARK_MASTER_HOST=master
export SPARK_DRIVER_MEMORY=1G
export SPARK_WORKLOAD=worker
export SPARK_WORKER_INSTANCES=1
export SPARK_WORKER_CORES=4
export SPARK_WORKER_MEMORY=4G
export SPARK_EXECUTOR_CORES=2
export SPARK_EXECUTOR_MEMORY=2g
export SPARK_HOME=/opt/spark
export PYSPARK_PYTHON=python3

#Spark
# export SPARK_MASTER_HOST=master
# export SPARK_WORKER_INSTANCES=1
# export SPARK_EXECUTOR_CORES=2
# export SPARK_EXECUTOR_MEMORY=2g
# export SPARK_HOME=/opt/spark
# export PYSPARK_PYTHON=python3

# #export SPARK_WORKER_CORES=1
# #export SPARK_WORKER_MEMORY=1G
# #export SPARK_DRIVER_MEMORY=1G
# #export SPARK_EXECUTOR_MEMORY=1G
# #export SPARK_WORKLOAD=worker
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/opt/hadoop/lib/native
export PATH=${SPARK_HOME}/bin:${SPARK_HOME}/sbin:${PATH}
