import pandas as pd

def load_songs(csv_path):
    df = pd.read_csv(csv_path)
    df = df[df['Enabled'] == True]
    return df
