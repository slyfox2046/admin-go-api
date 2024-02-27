package log

import "github.com/sirupsen/logrus"

var log  *logrus.Logger
var logToFile *logrus.Logger

// 日志文件名
var loggerFile string

func setLogFile(file string){
	loggerFile = file
}

// 初始化
func init(){
	setLogFile(filepath.Join(config.Config.Log.Path, config.Config.log.Name))
}