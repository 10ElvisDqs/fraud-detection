pipeline {
    agent any  // Se ejecuta en cualquier agente disponible

    stages {
        stage('Preparación 🛠️') {
            steps {
                echo '🔧 Preparando el entorno... elvis'
            }
        }

        stage('Construcción 🏗️') {
            steps {
                echo '🏗️ Construyendo la aplicación... david'
                // sh 'mvn clean install' o 'npm install'
            }
        }

        stage('Pruebas 🧪') {
            steps {
                echo '🧪 Ejecutando pruebas... quinteros'
                // sh 'mvn test' o 'npm test'
            }
        }

        stage('Despliegue 🚀') {
            steps {
                echo '🚀 Desplegando la aplicación... siles'
                // sh 'scp target/app.jar usuario@servidor:/ruta/'
            }
        }
    }

    post {
        always {
            echo '✅ Pipeline finalizado.'
        }
        success {
            echo '🎉 ¡Pipeline ejecutado correctamente!'
        }
        failure {
            echo '❌ Algo salió mal en el pipeline.'
        }
    }
}
