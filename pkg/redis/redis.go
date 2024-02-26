// 缓存redis配置初始化
package redis

import (
	"admin-go-api/common/config"
	"context"
	"github.com/go-redis/redis/v8"
)

var (
	RedisDb *redis.Client
)

// 初始化连接
func SetupRedisDb() error {
	var ctx = context.Background()
	RedisDb = redis.NewClient(&redis.Options{Addr: config.Config.Redis.Address, Password: config.Config.Password, DB: 0})
	_, err := RedisDb.Ping(ctx).Result()
	if err != nil {
		return err
	}
	return nil
}
