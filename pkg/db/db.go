package db

import (
	"admin-go-api/common/config"
	"fmt"
	"admin-go-api/api/entity"

	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	"gorm.io/gorm/logger"
)

var Db *gorm.DB

// 数据库初始化
func SetupDBLink() error {
	var err error
	var dbConfig = config.Config.Db
	// url:= "root:123456@tcp(127.0.0.1:3306)/admin-go-api?charset=utf8mb4&parseTime=True&loc=Local"
	url := fmt.Sprintf("%s:%s@tcp(%s:%d)/%s?charset=%s&parseTime=True&loc=Local",
		dbConfig.Username,
		dbConfig.Password,
		dbConfig.Host,
		dbConfig.Port,
		dbConfig.Db,
		dbConfig.Charset)

		fmt.Println("----------------------------------------------------------------")
		fmt.Println(url)
		fmt.Println("----------------------------------------------------------------")


	Db, err = gorm.Open(mysql.Open(url), &gorm.Config{
		Logger:                                   logger.Default.LogMode(logger.Info),
		DisableForeignKeyConstraintWhenMigrating: true,
	})
	if err != nil {
		panic(err)
	}
	if Db.Error	!= nil {
		panic(Db.Error)
	}
	// 迁移 schema
	Db.AutoMigrate(&entity.SysAdmin{})
	Db.AutoMigrate(&entity.SysPost{})
	Db.AutoMigrate(&entity.SysDept{})

	sqlDB, _ := Db.DB()
	sqlDB.SetMaxIdleConns(dbConfig.MaxIdle)
	sqlDB.SetMaxOpenConns(dbConfig.MaxOpen)

	return nil
}
