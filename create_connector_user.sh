#!/bin/bash

curl -X POST \
  -H "Content-Type: application/json" \
  --data '{ "name": "irida-db-user-source",
            "config": {
                "connector.class": "io.confluent.connect.jdbc.JdbcSourceConnector",
                "connection.url": "jdbc:mysql://irida-db:3306/irida",
		"connection.user": "root",
		"connection.password": "irida",
                "topic.prefix": "irida-db-",
                "tasks.max": 1,
                "mode": "timestamp+incrementing",
		"incrementing.column.name": "id", 
		"timestamp.column.name": "modifiedDate",
		"table.whitelist" : "user",
                "poll.interval.ms": 1000
            }
          }' \
  http://$CONNECT_HOST:8083/connectors
