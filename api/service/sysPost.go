// 岗位 服务层

package service

import (
	"admin-go-api/api/entity"
	"admin-go-api/api/dao"
	"github.com/gin-gonic/gin"
	"admin-go-api/common/result"
)

type ISysPostService interface {
 CreateSysPost( c *gin.Context,sysPost entity.SysPost)
}

type SysPostServiceImpl struct {
}


// 新增岗位
func (s SysPostServiceImpl) CreateSysPost(c *gin.Context, sysPost entity.SysPost) {
	bool := dao.CreateSysPost(sysPost)
	if !bool {
		result.Failed(c, int(result.ApiCode.POSTALREADYEXISTS), result.ApiCode.GetMessage(result.ApiCode.POSTALREADYEXISTS))
		return
	}
	result.Success(c, true)
}

var sysPostService = SysPostServiceImpl{}  //创建岗位对象

func SysPostService() ISysPostService {
	return &sysPostService
}