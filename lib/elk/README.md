## Add index path to values
### Create path
```shell
mkdir -p /path
```
### Set/Check permission
```shell
chow $USER: /path
```
### Add your path to values.yaml
```yaml
elk:
  elasticsearch:
    persistence:
      hostPath: /path
```
