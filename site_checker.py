import urllib.request
import time
from colorama import Fore
from colorama import Style

def check_uptime():
    t=300 ###########################################3####### Smeni ako sakas za pochesto / poretko da proverva (vo sec)
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
