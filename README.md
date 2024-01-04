# Using Apache Flink to store data in S3 using Apache Hudi

Use the docker-compose.yml file to create a MariaDB database and an Apache Flink Job and Task manager to work with.

Make sure to add your AWS credentials to the docker-compose.yml file first, so that it will be able to write to s3.

```
docker compose up -d
```

Once the containers are running, submit the job to Flink using:

```
docker exec -it jobmanager /opt/flink/bin/sql-client.sh embedded -f /opt/flink/job.sql
```

If you open your browser to `http://localhost:8081` you'll see the Flink UI with your job running, saving the data from the database to s3 using the Hudi format

The data in s3 will be in a folder named after the database.

You can use the AWS CLI to verfiy the data is there:

```
aws s3 ls s3://my-test-bucket/my_database/my_products/
```
