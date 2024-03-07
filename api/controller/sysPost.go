// 岗位 控制层
// author xiaoRui

package controller

import (
	"admin-go-api/api/entity"
	"admin-go-api/api/service"

	"github.com/gin-gonic/gin"
	// "strconv"
)

var sysPost entity.SysPost

// CreateSysPost @Summary 新增岗位接口
// @Produce json
// @Description 新增岗位接口
// @Param data body entity.SysPost true "data"
// @Success 200 {object} result.Result
// @router /api/post/add [post]
// @Security ApiKeyAuth
func CreateSysPost(c *gin.Context) {
	_ = c.BindJSON(&sysPost)
	service.SysPostService().CreateSysPost(c, sysPost)
}
