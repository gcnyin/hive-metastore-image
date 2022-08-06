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

Remember to run the hive schema sql in target database.

Then run

```
./build-hive-metastore.sh
```
