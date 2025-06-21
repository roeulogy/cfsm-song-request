import redis
import json

r = redis.Redis(host='redis', port=6379, decode_responses=True)

QUEUE_KEY = "song_queue"

def add_to_queue(song):
    r.rpush(QUEUE_KEY, json.dumps(song))

def get_queue():
    return [json.loads(item) for item in r.lrange(QUEUE_KEY, 0, -1)]

def clear_queue():
    r.delete(QUEUE_KEY)
