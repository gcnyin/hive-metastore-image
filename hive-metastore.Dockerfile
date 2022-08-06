FROM eclipse-temurin:8-jre-focal as builder
RUN apt update && apt install -y wget
RUN cd /opt && \
    wget https://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/common/hadoop-3.3.4/hadoop-3.3.4.tar.gz && \
    tar xf ./hadoop-3.3.4.tar.gz && \
    wget https://mirrors.tuna.tsinghua.edu.cn/apache/hive/hive-3.1.2/apache-hive-3.1.2-bin.tar.gz && \
    tar xf ./apache-hive-3.1.2-bin.tar.gz
RUN cd /opt/apache-hive-3.1.2-bin/lib && \
    wget https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.30/mysql-connector-java-8.0.30.jar && \
    wget https://repo1.maven.org/maven2/org/postgresql/postgresql/42.4.1/postgresql-42.4.1.jar && \
    wget https://repo1.maven.org/maven2/com/microsoft/sqlserver/mssql-jdbc/10.2.1.jre8/mssql-jdbc-10.2.1.jre8.jar
# in /opt/hadoop-3.3.4 and /opt/apache-hive-3.1.2-bin

FROM eclipse-temurin:8-jre-focal
RUN apt update && apt install -y \
        curl \
        wget \
        vim \
        nano \
        zip \
        unzip \
        netcat \
        jq

COPY --from=builder /opt/hadoop-3.3.4 /opt/hadoop
COPY --from=builder /opt/apache-hive-3.1.2-bin /opt/hive

ENV HADOOP_HOME /opt/hadoop
ENV HIVE_HOME /opt/hive

COPY ./hive-site.xml /opt/hive/conf

EXPOSE 9083

ENTRYPOINT ["/opt/hive/bin/hive", "--service", "metastore"]
