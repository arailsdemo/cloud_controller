config_file = File.expand_path('../../cloud_controller.yml', __FILE__)

AppConfig = YAML.load_file(config_file)

UserToken.token_key = AppConfig["keys"]["token"]
