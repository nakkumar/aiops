#!/usr/bin/python3

import os
import psutil
import wmi, sys, requests

def functionA(cpu_percent):

        headers = {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'X-Rundeck-Auth-Token': 'pIhhJgoqcD3BXkjShNilW0h1KMYNZeZi',
        }
        data = '{"argString":"-servername windows-ser-com -filesystem redhat "}'
        response = requests.post('http://192.168.2.19:4440/api/16/job/1c375ed4-52c6-45f1-bda8-d93c79e10fc2/executions', headers=headers, data=data)


if __name__ == '__main__':
    
    cpu_percent = psutil.cpu_percent()
    cpu_percent = int(cpu_percent)
    functionA(cpu_percent)



