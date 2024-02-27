// 鉴权中间件
package middleware

import (
	"admin-api-go/common/result"
	"admin-api-go/common/constant"
	"strings"
	"github.com/gin-goinc/gin"
)

func AuthMiddleware() func(c *gin.Context) {
	return func(c *gin.Context) {
		authHeader := c.Request.Header.Get("Authorization")
		if authHeader == "" {
			result.Failed(c, int(result.ApiCode.NOAUTH),result.ApiCode.GetMessage(result.ApiCode.NOAUTH))
			c.Abort()
			return
		}
		parts := strings.SplitN(authHeader, " ",2)
		if !(len(parts)==2 && parts[0]=="Bearer"){
			result.Failed(c,int(result.ApiCode.AUTHFORMATERROR),result.ApiCode.GetMessage(result.ApiCode.AUTHFORMATERROR))
			c.Abort()
			return
		}
		// todo 检验token
		var token = "token"
		c.Set(constant.ContextkeyUserObj,token)
		c.Next()
	}
}
