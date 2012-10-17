class InstallResources {

    static File targetDir
    static File scriptDir

    void doInstall() {
		['web-app/css/scaffolding.css', 'grails-app/conf/ScaffoldingResources.groovy', 'grails-app/views/index.gsp', 'grails-app/views/layouts/bootstrap.gsp'].each {
			copyFile new File(scriptDir, it), new File(targetDir, it)
		}

		['src/templates/scaffolding', 'grails-app/views/_fields/default', 'grails-app/taglib'].each {
			copyDirs(new File(scriptDir, it), new File(targetDir, it))
		}
	}

	void copyDirs(final File fromDir, final File toDir) {
		toDir.mkdirs()
		fromDir.eachFile() {File file ->
			if (file.isDirectory()) {
				copyDirs file, new File(toDir, file.name)
			} else {
				copyFile file, new File(toDir, file.name)
			}
		}
	}

	void copyFile(final File fromFile, final File toFile) {
		if (toFile.exists()) { toFile.delete() }
		println "Copying ${fromFile.absolutePath - scriptDir}"
		toFile << fromFile.bytes
	}
}
