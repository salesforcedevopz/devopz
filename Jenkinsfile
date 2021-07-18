#!groovy
 
import groovy.json.JsonSlurperClassic

node {



	def SF_CONSUMER_KEY=env.CONNECTED_APP_JENKINS
    def SF_USERNAME=env.DEVHUB_ORG
    def SERVER_KEY_CREDENTALS_ID=env.JENKIN_SERVER_KEY
    def TEST_LEVEL='RunLocalTests'
	
   
    def SF_INSTANCE_URL = env.SFDC_URL ?: "https://login.salesforce.com"
	println SF_CONSUMER_KEY
	println SF_USERNAME
	println SERVER_KEY_CREDENTALS_ID
	println SF_INSTANCE_URL
 
    def toolbelt = tool 'toolbelt'
	
	
	
	stage('checkout source') {
        checkout scm
    }
  withCredentials([file(credentialsId: SERVER_KEY_CREDENTALS_ID, variable: 'server_key_file')]) {
 
            // -------------------------------------------------------------------------
            // Authorize the Dev Hub org with JWT key and give it an alias.
            // -------------------------------------------------------------------------
 
            stage('Authorize DevHub') {
			if(isUnix()){
                rc =sh returnstatus: true, script:  "${toolbelt} force:auth:jwt:grant --instanceurl ${SF_INSTANCE_URL} --clientid ${SF_CONSUMER_KEY} --username ${SF_USERNAME} --jwtkeyile ${server_key_file} --setdefaultdevhubusername --setalias HubOrg"
				}else {
				bat "${toolbelt} update"
				rc = bat returnstatus: true, script:  "${toolbelt} force:auth:jwt:grant --instanceurl ${SF_INSTANCE_URL} --clientid ${SF_CONSUMER_KEY} --username ${SF_USERNAME} --jwtkeyfile ${server_key_file} --setdefaultdevhubusername --setalias HubOrg"
			}
                if (rc == 0) {
                    error 'Salesforce dev hub org authorization failed.'
                }
            println rc
			if(isUnix()){
			rmsg = sh returnStdout:true, script:"${toolbelt} force:mdapi:deploy -d manifest/. -u${SF_USERNAME}"
			}else{
			rmsg = sh returnStdout:true, script:"${toolbelt} force:mdapi:deploy -d manifest/. -u${SF_USERNAME}"
			}
		    println rmsg
	    }
}
}
