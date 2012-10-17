//
// This script is executed by Grails after plugin was installed to project.
// This script is a Gant script so you can use all special variables provided
// by Gant (such as 'baseDir' which points on project base dir). You can
// use 'ant' to access a global instance of AntBuilder
//
// For example you can create directory under project tree:
//
//    ant.mkdir(dir:"${basedir}/grails-app/jobs")
//

new InstallResources(pluginBasedir, basedir).doInstall()

class InstallResources {

    final File targetDir
    final File scriptDir
    final boolean verbose = false

    InstallResources(final String pluginDir, final String appBaseDir) {
        targetDir = new File(appBaseDir)
        scriptDir = new File(pluginDir)
    }

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
		if (verbose) println "Copying ${fromFile.absolutePath - scriptDir}"
		toFile << fromFile.bytes
	}
}
