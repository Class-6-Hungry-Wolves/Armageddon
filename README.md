# Class 6 Hungry Wolves Armageddon Project

## Overview
Our POC project is an infrastructure design and implementation initiative for **Tokyo Midtown Medical Center (TMMC)** to establish a global telehealth service called **J-Tele-Doctor**. This solution will enable TMMC customers to access medical care remotely while complying with strict data localization and security requirements. The project focuses on leveraging **AWS Japan** as the primary cloud  and spans across multiple global regions.

---

## Requirements

### Global Hosting Locations
The application must provide local hosting for Japanese and foreign customers in the following regions:
- Tokyo
- New York
- London
- São Paulo
- Australia
- Hong Kong
- California

---

### Regional Deployment Specifications
Each region must meet the following criteria:
1. **Auto Scaling Group (ASG)** with a minimum of 2 Availability Zones (AZs).
2. At least **1 EC2 instance** deployed for the test environment.
3. Resources deployed in a **security zone** to facilitate syslog data transfer.
4. **Port 80** (HTTP) must be open to the public.

---

### Each Region Pinging Tokyo

![Screenshot_2024-12-09_205840](https://github.com/user-attachments/assets/29449553-47bc-4a54-aba8-58da0da24f31)
![Screenshot_2024-12-09_210221](https://github.com/user-attachments/assets/dafc19ee-a37d-4301-aa5a-f2c613ecdb6f)
![Screenshot_2024-12-09_202043](https://github.com/user-attachments/assets/c28b88be-e477-431d-b5fe-a31bcdb4e40f)
![Screenshot_2024-12-09_203548](https://github.com/user-attachments/assets/8acffcca-a162-4731-b6ed-73a04df1e252)
![Screenshot_2024-12-09_204547](https://github.com/user-attachments/assets/f4cb3432-2175-4081-8d9d-9da8f57e4515)
![Screenshot_2024-12-09_204956](https://github.com/user-attachments/assets/b9273983-1fe7-4522-88d0-365cefdc7d57)

