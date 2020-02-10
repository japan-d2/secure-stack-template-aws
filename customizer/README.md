# Customizer
当テンプレート中のMetadataやDefaultを追加/上書きするためのツールです。  
Japan Digital Design, Inc. ではService Catalogを利用しているため、バージョン管理のためのMetadata及び社内向けDefault値を当ツールで付与しています。

## Requirements
- Docker

## 使用方法
```sh
docker build -t customizer .
docker run -v PATH_TO_THIS_REPOSITORY:/workdir -v PATH_TO_CONFIG_FILE:/workdir/template_override_config.yaml customizer
```

## 設定例
```yaml
dir_name:
  subdir1_name:
    subdir2_name:
      template_name:
        cfn_template_key1:
          cfn_template_subkey1: somevalue
          cfn_template_subkey2: somevalue
```

`cfn_template_key1` 以下に設定されたKey-Valueが `template_name` で指定されたテンプレートの当該Key-Valueとして追加もしくは上書きされます。  
追加もしくは上書きされたテンプレートは `out` ディレクトリ以下に出力されます。
[こちら](template_override_config.example.yaml)も参考にしてください。