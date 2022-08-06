# hive-metastore-image

Hive metastore container image.

## Build

Edit `hive-site.xml`, change

- `hive.metastore.db.type`
- `javax.jdo.option.ConnectionDriverName`
- `javax.jdo.option.ConnectionDriverName`
- `javax.jdo.option.ConnectionURL`
- `javax.jdo.option.ConnectionUserName`
- `javax.jdo.option.ConnectionPassword`

Then run

```
./build-hive-metastore.sh
```

**_NOTE:_** Please run the `hive/scripts/metastore/upgrade` scripts into your target database before starting the container.
