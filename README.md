# chef-ingest

---

Chef-Ingest is a project to help me get experience working with Helm Charts with the use case of managing various K8 cronjobs for DataHub metadata ingestions. The idea being to achieve a middle ground between flexibility & reusability for team specific requirements.

The project name stems from the fact that the configuration files used in `DataHub` are referred to as `recipes`, and reusing configuration settings can be thought of as `ingredients`

| Key                    | Type   | Default                       | Description                 |
| ---------------------- | ------ | ----------------------------- | --------------------------- |
| global.imageRegistry   | string | `docker.io`                   | Image registry to utilize   |
| global.datahub.version | string | `v.0.14.0.1`                  | DataHub version to utilize  |
| image.repository       | string | `acryldata/datahub-ingestion` | Image repository to utilize |
| image.pullPolicy       | string | `IfNotPresent`                |                             |
