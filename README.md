# Class 6 Hungry Wolves Armageddon Project

## Overview
Our POC project is an infrastructure design and implementation initiative for **Tokyo Midtown Medical Center (TMMC)** to establish a global telehealth service called **J-Tele-Doctor**. This solution will enable TMMC customers to access medical care remotely while complying with strict data localization and security requirements. The project focuses on leveraging **AWS Japan** as the primary cloud provider and spans across multiple global regions.

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

