from datetime import datetime
from time import sleep
import csv
try:
    from gps import GPS
except:
    class GPS():
        lat = 0.0
        lon = 0.0
def main():
    gps = GPS()
    filename = datetime.now().strftime("/home/ficha/gps_data/%Y-%m-%d_%H:%M:%S.csv")
    fieldnames = ['timestamp', 'latitude', 'longitude']
    csvfile = open(filename, 'w')
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
    writer.writeheader()
    csvfile.close()
    csvfile = open(csvfile.name, 'a')
    while True:
        sleep(5)
        dict = {
            'timestamp': datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
            'latitude': gps.lat,
            'longitude': gps.lon,
        }
        print(dict)
        csvfile = open(csvfile.name, 'a')
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        writer.writerow(dict)
        csvfile.close()
if __name__ == "__main__":
    main()









