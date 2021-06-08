# hive metastore java api 
通过 hive metastore api查询元数据信息。
## 依赖
```xml
 <dependency>
      <groupId>org.apache.hive</groupId>
      <artifactId>hive-jdbc</artifactId>
      <version>1.2.2</version>
      <exclusions>
        <exclusion>
          <groupId>org.eclipse.jetty.aggregate</groupId>
          <artifactId>jetty-all</artifactId>
        </exclusion>
      </exclusions>
    </dependency>
    <dependency>
      <groupId>org.apache.hadoop</groupId>
      <artifactId>hadoop-client</artifactId>
      <version>2.7.7</version>
    </dependency>
    <dependency>
      <groupId>org.apache.hive</groupId>
      <artifactId>hive-exec</artifactId>
      <version>1.2.2</version>
    </dependency>
    <dependency>
      <groupId>org.apache.commons</groupId>
      <artifactId>commons-compress</artifactId>
      <version>1.20</version>
    </dependency>
```
## Code
```java
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.hive.conf.HiveConf;
import org.apache.hadoop.hive.metastore.IMetaStoreClient;
import org.apache.hadoop.hive.metastore.api.Table;
import org.apache.hadoop.hive.ql.metadata.HiveException;
import org.apache.thrift.TException;

public class Hive {

    public static void main(String[] args) throws TException, HiveException {
        final String hiveConfPath="/Users/mikusugar/code/test/jdk8_test/src/main/resources/conf/hive-site.xml";
        Configuration configuration = new Configuration();
        configuration.addResource(new Path(hiveConfPath));
        HiveConf hiveConf = new HiveConf(configuration, Hive.class);
        final IMetaStoreClient client = org.apache.hadoop.hive.ql.metadata.Hive.get(hiveConf).getMSC();
        System.out.println(client.getAllDatabases());
        final Table res = client.getTable("flink", "flink_web_source");
        System.out.println(res.toString());
        client.close();
    }
}
```
拿到 `IMetaStoreClient`实例就可以愉快玩耍了。