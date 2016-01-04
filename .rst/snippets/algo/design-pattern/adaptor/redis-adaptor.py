import redis


class RedisAdaptor(object):
    def __init__(self):
        self.conn = redis.Redis("localhost")

    # adaptor method
    # connのkeysとdeleteをラップして、使いやすいインターフェイスを提供している
    # 必要なメソッドだけ定義すればよいので、Redisを継承するより委譲がよい
    def flush(self, prefix=""):
        for k in self.conn.keys("*"):
            if k.startswith(prefix):
                self.conn.delete(k)
