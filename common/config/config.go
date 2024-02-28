// 文件配置 
package config

import (
	"gopkg.in/yaml.v2"
	"io/ioutil"
)

// 总配置文件
type config struct {
	// Add your configuration fields here
	Server server 	`yaml:"server"`
	Db db `yaml:"db"`
	Redis redis `yaml:"redis"`
	ImageSettings imageSettings `yaml:"imageSettings"`
	Log log `yaml:"log"`
	
	// Mysql mysql 	`yaml:"mysql"`
	// Redis redis 	`yaml:"redis"`
}
// 项目端口配置
type server struct {
	Address string `yaml:"address"`
	Model string `yaml:"model"`
}

// 数据库配置
type db struct {
	Dialects string `yaml:"dialects"`
	Host string `yaml:"host"`
	Port int `yaml:"port"`
	Db string `yaml:"db"`
	Username string `yaml:"username"`
	Password string `yaml:"password"`
	Charset string `yaml:"charset"`
	MaxIdle int `yaml:"max_idle"`
	MaxOpen int `yaml:"max_open"`
}

// redis配置
type redis struct {
	Address string `yaml:"address"`
	Password string `yaml:"password"`

}

// imageSettings图片上传配置
type imageSettings struct {
	UploadDir string `yaml:"upload_dir"`
	ImageHost string `yaml:"image_host"`
}

// log日志配置
type log struct {
	Path string `yaml:"path"`
	Name string `yaml:"name"`
	Model string `yaml:"model"`
}

var Config *config

// 配置初始化
func init(){
	ymalFile, err :=ioutil.ReadFile("./config.yaml")
		// 有错就down机
		if err!=nil {
			panic(err)
		}

		// 绑定值
		err = yaml.Unmarshal(ymalFile,&Config)
		if err!=nil {
			panic(err)
		}
}