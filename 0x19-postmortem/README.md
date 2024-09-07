Issue Summary:
Outage Duration:
Start: August 15, 2024, 10:00 AM GMT
End: August 15, 2024, 12:30 PM GMT

Impact:
The web application experienced downtime for 2 hours and 30 minutes due to a server crash. During this period, approximately 60% of users could not access the service, while the rest faced slow response times. This impacted key functionalities like user login and data retrieval from the database.

Root Cause:
The outage was caused by a misconfiguration in the server’s load balancer, leading to a server overload and crash when traffic spiked.

Timeline:
10:05 AM: Issue detected through monitoring alerts reporting increased load times.
10:10 AM: Investigation began on the affected server by the on-call engineer.
10:20 AM: The database was ruled out as the root cause after checking CPU and memory usage.
10:30 AM: Focus shifted to investigating the load balancer configuration.
10:45 AM: Misleading debugging path: initially, the load balancer's routing algorithm was suspected.
11:00 AM: Load balancer misconfiguration was identified as the root cause.
11:15 AM: Escalated to the DevOps team to correct the configuration.
12:00 PM: The load balancer configuration was corrected, and traffic resumed normal distribution across servers.
12:30 PM: All services were restored to normal, and monitoring confirmed system stability.
Root Cause and Resolution:
The issue was due to a misconfiguration in the load balancer settings. A recently deployed configuration change mistakenly removed limits on the traffic that each server could handle, causing one server to become overloaded while others remained underutilized. As traffic increased, this led to a complete crash of the overloaded server.

To resolve the issue, the load balancer configuration was reverted to a previously stable version, which restored traffic distribution across all available servers. Additional traffic routing rules were added to prevent overloading in the future.

Corrective and Preventative Measures:
Improved monitoring: Add enhanced traffic monitoring to the load balancer to detect misconfigurations more quickly.
Configuration review: Implement stricter review processes for configuration changes, including automated testing before deployment.
Documentation update: Update load balancer setup documentation to include potential risks when changing traffic routing rules.
TODO:

Patch load balancer to prevent overload.
Add server memory monitoring.
Review and test all future configuration changes before deploying.
