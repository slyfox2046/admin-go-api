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
 GetSysPostList(c *gin.Context, PageNum, PageSize int, PostName, PostStatus, BeginTime, EndTime string)
 GetSysPostById(c *gin.Context, Id int) 
}

type SysPostServiceImpl struct {
}

// 根据id查询岗位
func (s SysPostServiceImpl) GetSysPostById(c *gin.Context, Id int) {
	result.Success(c, dao.GetSysPostById(Id))
}

// 分页查询岗位列表
func (s SysPostServiceImpl) GetSysPostList(c *gin.Context, PageNum, PageSize int, PostName, PostStatus, BeginTime, EndTime string) {
	if PageSize < 1 {
		PageSize = 10
	}
	if PageNum < 1 {
		PageNum = 1
	}
	sysPost, count := dao.GetSysPostList(PageNum, PageSize, PostName, PostStatus, BeginTime, EndTime)
	result.Success(c, map[string]interface{}{"total": count, "pageSize": PageSize, "pageNum": PageNum, "list": sysPost})
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

