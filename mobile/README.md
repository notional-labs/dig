## Install Flutter
[Get Started](https://docs.flutter.dev/get-started/install)

## Development

### Get dependencies
`bash scripts/pub_upgrade_all.sh`


### Generate code
`bash scripts/gen_code_all.sh`



### Multi languages
- Define languages inside: `lib/assets/l10n`
- Generate languages: `bash scripts/gen_lang.sh`
- Use: `S.current.<language_key>`


### Build with command
`flutter run -t lib/main_dev.dart --flavor dev -d <device_id>`


### Get device id
`flutter devices`



