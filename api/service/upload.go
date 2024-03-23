// 图片上传 服务层
// author xiaoRui

package service

import (
	"admin-go-api/common/config"
	"admin-go-api/common/result"
	"admin-go-api/common/util"
	"fmt"
	"os"
	"path"
	"strconv"
	"time"

	"github.com/gin-gonic/gin"
)

type IUploadService interface {
	Upload(c *gin.Context)
}

type UploadServiceImpl struct{}

// 图片上传
func (u UploadServiceImpl) Upload(c *gin.Context) {
	file, err := c.FormFile("file")
	if err != nil {
		result.Failed(c, int(result.ApiCode.FILEUPLOADERROR), result.ApiCode.GetMessage(result.ApiCode.FILEUPLOADERROR))
	}
	now := time.Now()
	ext := path.Ext(file.Filename)
	fileName := strconv.Itoa(now.Nanosecond()) + ext
	// 获取当前路径 
	dir, err := os.Getwd()
	if err != nil {
		fmt.Println(err)
	}
	filePath := fmt.Sprintf("%s%s%s%s",
		config.Config.ImageSettings.UploadDir,
		fmt.Sprintf("%04d", now.Year()),
		fmt.Sprintf("%02d", now.Month()),
		fmt.Sprintf("%02d", now.Day()))
	err = util.CreateDir(dir+filePath)
	if err != nil {
		fmt.Println(err)
		result.Failed(c, int(result.ApiCode.FILEUPLOADERROR), result.ApiCode.GetMessage(result.ApiCode.FILEUPLOADERROR))
		return
	}
	fullPath := filePath + "/" + fileName
	c.SaveUploadedFile(file,dir + fullPath)
	result.Success(c, config.Config.ImageSettings.ImageHost+fullPath)
	// result.Success(c, fullPath)
}

var uploadService = UploadServiceImpl{}

func UploadService() IUploadService {
	return &uploadService
}
