# Ingredients

These files are used to help set a default structure to the DataHub recipe configs based on the platform. Common structures are broken out to build on-top of each other. For example the following is used to create the configuration with a MySQL source `starter.yaml -> database.yaml -> mysql.yaml`, taking the configurations from `starter.yaml`, then overriding them with configurations from `database.yaml`, and so forth.


### Starter

These are the common high level configurations that are shared across all sources.


### Database

These configurations are shared across relational database platforms like MySQL & Postgres


### Platform Specific

Configurations in these files are specific to that platform.
