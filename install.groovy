/*
To use this script:

cd to your grails app, and run the install groovy script from the scaffolding directory:
$ grails create-app bookstore
$ cd bookstore
$ groovy ~/Downloads/twitter-bootstrap-scaffolding/install.groovy

Have fun!
*/

class Installer {
	final File targetDir = new File('.')
	final File scriptDir = new File(getClass().protectionDomain.codeSource.location.path).parentFile

	void doInstall() {
		['web-app/css/scaffolding.css', 'grails-app/conf/ScaffoldingResources.groovy', 'grails-app/views/index.gsp', 'grails-app/views/layouts/bootstrap.gsp'].each {
			copyFile new File(scriptDir, it), new File(targetDir, it)
		}

		['src/templates/scaffolding', 'grails-app/views/_fields/default', 'grails-app/taglib'].each {
			copyDirs(new File(scriptDir, it), new File(targetDir, it))
		}
	}

	void copyDirs(File fromDir, File toDir) {
		toDir.mkdirs()
		fromDir.eachFile() {File file ->
			if (file.isDirectory()) {
				copyDirs file, new File(toDir, file.name)
			} else {
				copyFile file, new File(toDir, file.name)
			}
		}
	}

	void copyFile(File fromFile, File toFile) {
		if (toFile.exists()) { toFile.delete() }
		println "Copying ${fromFile.absolutePath - scriptDir}"
		toFile << fromFile.bytes
	}
}

new Installer().doInstall()
