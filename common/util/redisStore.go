// redis存取验证码
package util

import (
	"admin-go-api/common/constant"
	"admin-go-api/pkg/redis"
	"context"
	"log"
	"time"
)

var ctx = context.Background()

type RedisStore struct {}

// 存验证码
func (r RedisStore) Set(id string, value string) error {
	key:=constant.LOGIN_CODE +id
	// 设置缓存
	err:=	redis.RedisDb.Set(ctx, key, value, time.Minute * 5).Err()
	if err != nil {
		log.Println(err.Error())
		return err
	}
	return nil
}

// 获取验证码
func (r RedisStore) Get(id string,clear bool) string {
	key:=constant.LOGIN_CODE +id
	val ,err:=redis.RedisDb.Get(ctx, key).Result()
	if err != nil {
		return ""
	}
	return val
}

// 校验验证码
func (r RedisStore) Verify(id,answer string,clear bool) bool {
	v:=RedisStore{}.Get(id, clear)
return v== answer
}
