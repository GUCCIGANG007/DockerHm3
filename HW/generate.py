import csv
import random
import os
import sys

NUM_ROWS = 50

COLUMNS = ["id", "player", "team", "age", "goals", "assists", "position", "country"]

def generate_row():
    return {
        "id": random.randint(1000, 9999),
        "player": random.choice(["Lionel Messi", "Cristiano Ronaldo", "Kylian Mbappe", "Erling Haaland", 
                               "Jude Bellingham", "Vinicius Jr", "Harry Kane", "Mohamed Salah"]),
        "team": random.choice(["Argentina", "Portugal", "France", "Brazil", "England", "Germany", "Spain"]),
        "age": random.randint(18, 41),
        "goals": random.randint(0, 15),
        "assists": random.randint(0, 12),
        "position": random.choice(["Forward", "Midfielder", "Defender", "Goalkeeper"]),
        "country": random.choice(["Argentina", "Portugal", "France", "Brazil", "England", "Germany"])
    }

OUTPUT_DIR = sys.argv[1] if len(sys.argv) > 1 else "/data"
OUTPUT_FILE = os.path.join(OUTPUT_DIR, "data.csv")

os.makedirs(OUTPUT_DIR, exist_ok=True)

rows = [generate_row() for _ in range(NUM_ROWS)]

with open(OUTPUT_FILE, "w", newline="", encoding="utf-8") as f:
    writer = csv.DictWriter(f, fieldnames=COLUMNS)
    writer.writeheader()
    writer.writerows(rows)




