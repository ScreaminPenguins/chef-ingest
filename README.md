# chef-ingest

---

Chef-Ingest is a project to help me get experience working with Helm Charts with the use case of managing various K8 cronjobs for DataHub metadata ingestions. The idea being to achieve a middle ground between flexibility & reusability for team specific requirements.

As a team we want:

- Control what platforms we try to ingest (Ensure configurations are accurate)
- Enable dev & prod instance of `DataHub` to be able to ingest all environments for a given database.
- Simplify the input needed for the cronjob/Make it DRY

The project name stems from the fact that the configuration files used in `DataHub` are referred to as `recipes`, and reusing configuration settings can be thought of as `ingredients`.

---

## Values Schema

| Key                                                | Type   | Default                       | Description                                                                                                    |
| -------------------------------------------------- | ------ | ----------------------------- | -------------------------------------------------------------------------------------------------------------- |
| global.imageRegistry                               | string | `docker.io`                   | Image registry to utilize                                                                                      |
| global.datahub.version                             | string | `v.0.14.0.1`                  | DataHub version to utilize                                                                                     |
| image.repository                                   | string | `acryldata/datahub-ingestion` | Image repository to utilize                                                                                    |
| image.pullPolicy                                   | string | `IfNotPresent`                |                                                                                                                |
| secrets.ingredients                                | object | `{}`                          | Object containing key:map pairs to create secrets to be used as the `DataHub Source configurations` in recipes |
| secrets.sink.dataHubSink                           | string | `""`                          | DataHub API token used to authenticate to the `DataHub GMS` service                                            |
| secrets.sink.kafkaSaslUser                         | string | `""`                          | SASL_USERNAME                                                                                                  |
| secrets.sink.kafkaSaslPswd                         | string | `""`                          | SASL_PASSWORD                                                                                                  |
| secrets.sink.schemaRegBasicAuth                    | string | `""`                          | BASIC.AUTH.USER.INFO                                                                                           |
| crons.<platform_type>                              | object | `nil`                         | The platform type to ingest metadata from                                                                      |
| crons.<platform_type>.<instance_name>.             | array  | `nil`                         | A list of platform instances to ingest into `DataHub`                                                          |
| crons.<platform_type>.<instance_name>.platform_env | string | `nil`                         | The release environment of the platform instance                                                               |
| crons.<platform_type>.<instance_name>.source       | object | `nil`                         | `DataHub Source` configuration default overrides                                                               |

- Supported Platforms
  - Bigquery
  - Kafka
  - Kafka-Connect
  - MySQL
  - Postgres
