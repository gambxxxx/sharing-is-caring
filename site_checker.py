import urllib.request
import time
import colorama
from colorama import Fore
from colorama import Style

def check_uptime():
    t=2 
    web_site_url="http://allutomotive.com/"
    web_site_name="Allutomotive.com"
    while True:
        try:
            print(urllib.request.urlopen(web_site_url).getcode())
            print(web_site_name)
            print(f' is {Fore.GREEN}UP AND RUNNING !!!{Style.RESET_ALL}')
        except:
            print(web_site_name)
            print (f' is {Fore.RED}DOWN !!!{Style.RESET_ALL}')
        finally:
            time.sleep(t)

check_uptime()
