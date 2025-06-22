from flask import Flask, render_template, request, redirect, url_for
from app.songs_loader import load_songs
from app.queue import add_to_queue, get_queue, clear_queue

import os

app = Flask(__name__)
csv_path = os.path.join(os.path.dirname(__file__), "..", "SongsMasterGrid.csv")
songs_df = load_songs(csv_path)

@app.route("/")
def index():
    queue = get_queue()
    return render_template("index.html", songs=songs_df.to_dict(orient="records"), queue=queue)

@app.route("/request/<int:index>")
def request_song(index):
    song = songs_df.iloc[index].to_dict()
    add_to_queue(song)
    return redirect(url_for('index'))

@app.route("/clear")
def clear():
    clear_queue()
    return redirect(url_for('index'))

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
