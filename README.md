# Website Deployment with Jenkins

This repository contains a script for deploying websites using Jenkins. The deployment script creates virtual hosts for specified websites on an Apache server. The deployment process includes copying configuration files, creating directories, and restarting the Apache server.

## Files in the Repository

- **deploy-script.sh:** The main deployment script that creates virtual hosts for specified websites.
- **template-vhost.conf_tmp:** Template for Apache virtual host configuration.
- **env-setups-details.txt:** List of websites to be deployed.
- **completed-setup.db:** Log file to track completed website setups.

## Instructions

### Prerequisites

- Ensure that the Apache server is installed and configured on the target machine.
- Jenkins should be set up with appropriate permissions to execute the deployment script.

### Usage

1. **Configure Jenkins to Execute the Deployment Script:**
   - Open Jenkins and create a new Freestyle or Pipeline job.
   - In the job configuration, add a build step to execute a shell command.
   - Enter the following command:

     ```bash
     /path/to/deploy-script.sh
     ```

   - Ensure that Jenkins has the necessary permissions to execute the script.

2. **Configure Jenkins to Pull the Repository:**
   - Add a Source Code Management (SCM) step in the job configuration.
   - Choose the appropriate SCM option (e.g., Git).
   - Enter the repository URL (e.g., `https://github.com/your-username/your-repo.git`).
   - Set up credentials if the repository is private.

3. **Specify Jenkins Build Triggers:**
   - In the job configuration, specify build triggers. For example, you can trigger the build when changes are pushed to the repository.

4. **Configure Jenkins Environment Variables (Optional):**
   - If your deployment script relies on environment variables, configure them in the Jenkins job configuration.

### Important Note

- The script checks the `completed-setup.db` file to avoid re-deploying websites that are already set up.
- Adjust the script to include additional error checks or customization based on your requirements.

## Logos
<a href="https://jenkins.io">
    <img width="400" src="https://www.jenkins.io/images/jenkins-logo-title-dark.svg" alt="Jenkins logo"> 
</a>
<img src=https://img.shields.io/badge/GitHub%20Pages-222222?style=for-the-badge&logo=GitHub%20Pages&logoColor=white />
## Automation with Jenkins

- This deployment script can be used with Jenkins for automated website setups.
- Ensure Jenkins has the necessary permissions and configurations to access the repository and execute the deployment script.

## Author

- **Abhishek Singh**
- **abhaythakur560@gmail.com**

For any issues or questions, feel free to contact me.
