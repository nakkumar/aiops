#!/usr/bin/python3

import os
import psutil
import wmi, sys, requests

def functionA(cpu_usage):

        headers = {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'X-Rundeck-Auth-Token': 'pIhhJgoqcD3BXkjShNilW0h1KMYNZeZi',
        }
        data = '{"argString":"-servername windows-ser-com -filesystem redhat "}'
        response = requests.post('http://192.168.2.19:4440/api/16/job/9b67c3b3-4e4d-48f8-84f8-54765aee934e/executions', headers=headers, data=data)

if __name__ == '__main__':
    
    cpu_usage = psutil.cpu_percent()
    cpu_usage = int(cpu_usage)
    functionA(cpu_usage)