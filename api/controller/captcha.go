// 验证码控制层
package controller

import (
	"admin-go-api/api/service"
	"admin-go-api/common/result"

	"github.com/gin-gonic/gin"
)


// @Summary 验证码接口
// @Produce json
// @Description 验证码接口
// @Success 200 {object} result.Result
// @router /api/captcha [get] 
func Captcha(c *gin.Context) {
	// 生成验证码
	id, base64Image := service.CaptMake()
	result.Success(c, map[string]interface{}{"idKey": id, "image": base64Image})

}
