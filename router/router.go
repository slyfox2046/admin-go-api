// 访问接口路由配置
package router

import (
	"admin-go-api/api/controller"
	"admin-go-api/common/config"
	"admin-go-api/middleware"
	"net/http"

	"github.com/gin-gonic/gin"
	swaggerFiles "github.com/swaggo/files"
	ginSwagger "github.com/swaggo/gin-swagger"
)

// 初始化路由
func InitRouter() *gin.Engine {
	router := gin.New()
	// 宕机恢复
	router.Use(gin.Recovery())
	// 跨域中间件
	router.Use(middleware.Cors())
	// 图片访问路径静态文件夹可直接访问
	router.StaticFS(config.Config.ImageSettings.UploadDir, http.Dir(config.Config.ImageSettings.UploadDir))
	// 日志log中间件
	router.Use(middleware.Logger())
	register(router)
	return router
}

// 路由注册
func register(router *gin.Engine) {
	router.GET("/api/captcha", controller.Captcha)
	router.GET("/swagger/*any", ginSwagger.WrapHandler(swaggerFiles.Handler))
	router.POST("/api/login", controller.Login)

	router.POST("/api/post/add", controller.CreateSysPost)
	router.GET("/api/post/list", controller.GetSysPostList)
	router.GET("/api/post/info", controller.GetSysPostById)
	router.PUT("/api/post/update", controller.UpdateSysPost)
	router.DELETE("/api/post/delete", controller.DeleteSysPostById)
	router.DELETE("/api/post/batch/delete", controller.BatchDeleteSysPost)
	router.PUT("/api/post/updateStatus", controller.UpdateSysPostStatus)
	router.GET("/api/post/vo/list", controller.QuerySysPostVoList)

	router.GET("/api/dept/list", controller.GetSysDeptList)
	router.POST("/api/dept/add", controller.CreateSysDept)
	router.GET("/api/dept/info", controller.GetSysDeptById)
	router.PUT("/api/dept/update", controller.UpdateSysDept)
	router.DELETE("/api/dept/delete", controller.DeleteSysDeptById)
	router.GET("/api/dept/vo/list", controller.QuerySysDeptVoList)

	router.POST("/api/menu/add", controller.CreateSysMenu)
	router.GET("/api/menu/vo/list", controller.QuerySysMenuVoList)
	router.GET("/api/menu/info", controller.GetSysMenu)
	router.PUT("/api/menu/update", controller.UpdateSysMenu)
	router.DELETE("/api/menu/delete", controller.DeleteSysMenu)
	router.GET("/api/menu/list", controller.GetSysMenuList)

	router.POST("/api/role/add", controller.CreateSysRole)
	router.GET("/api/role/info", controller.GetSysRoleById)
	router.PUT("/api/role/update", controller.UpdateSysRole)
	router.DELETE("/api/role/delete", controller.DeleteSysRoleById)
	router.PUT("/api/role/updateStatus", controller.UpdateSysRoleStatus)
	router.GET("/api/role/list", controller.GetSysRoleList)
	router.GET("/api/role/vo/list", controller.QuerySysRoleVoList)
	router.GET("/api/role/vo/idList", controller.QueryRoleMenuIdList)
	router.PUT("/api/role/assignPermissions", controller.AssignPermissions)

	router.POST("/api/admin/add", controller.CreateSysAdmin)
	router.GET("/api/admin/info", controller.GetSysAdminInfo)
	router.PUT("/api/admin/update", controller.UpdateSysAdmin)
	router.DELETE("/api/admin/delete", controller.DeleteSysAdminById)
	router.PUT("/api/admin/updateStatus", controller.UpdateSysAdminStatus)
	router.PUT("/api/admin/updatePassword", controller.ResetSysAdminPassword)
	router.GET("/api/admin/list", controller.GetSysAdminList)
	router.POST("/api/upload", controller.Upload)
	router.PUT("/api/admin/updatePersonal", controller.UpdatePersonal)
	router.PUT("/api/admin/updatePersonalPassword", controller.UpdatePersonalPassword)

		// router.GET("/api/sysLoginInfo/list", controller.GetSysLoginInfoList)
	// router.DELETE("/api/sysLoginInfo/batch/delete", controller.BatchDeleteSysLoginInfo)
	// router.DELETE("/api/sysLoginInfo/delete", controller.DeleteSysLoginInfoById)
	// router.DELETE("/api/sysLoginInfo/clean", controller.CleanSysLoginInfo)
	// router.GET("/api/sysOperationLog/list", controller.GetSysOperationLogList)
	// router.DELETE("/api/sysOperationLog/delete", controller.DeleteSysOperationLogById)
	// router.DELETE("/api/sysOperationLog/batch/delete", controller.BatchDeleteSysOperationLog)
	// router.DELETE("/api/sysOperationLog/clean", controller.CleanSysOperationLog)

}
