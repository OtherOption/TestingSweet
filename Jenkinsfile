pipeline {
    agent any
    stages {
        stage('Build Bot') {
            steps {
                //Insert config filename here
                def mycfg_file = '<substitute-alpha-numeric-value-cfgfille-here-within-quotes>'

                configFileProvider([configFile(fileId: mycfg_file, variable: 'PACKER_OPTIONS')]) {
                    echo " =========== ^^^^^^^^^^^^ Reading config from pipeline script "
                    sh "cat ${env.PACKER_OPTIONS}"
                    echo " =========== ~~~~~~~~~~~~ ============ "
                    echo " =========== ^^^^^^^^^^^^ Reading config via Python... "
                    sh "python build_image.py ${env.PACKER_OPTIONS}"
                    echo " =========== ~~~~~~~~~~~~ ============ "
                }
 
            }

        //END Build phase
        }
        
/*
        stage ('Invoke_pipeline') {
            steps {
                build job: 'pipeline1', parameters: [
                string(name: 'param1', value: "value1")
                ]
            }

        //END Invoke Phase
        }
*/

        stage('Run Bot') {

            steps {
                sh 'java -jar demo-1.jar'
            }
        
        //END Run Phase
        }

    }
}