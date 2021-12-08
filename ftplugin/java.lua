-- If you started neovim within `~/dev/xy/project-1` this would resolve to `project-1`
local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

-- adjust the `cmd` property of the `config`:
local config = {
  cmd = {
      "/Library/Java/JavaVirtualMachines/jdk-11.0.10.jdk/Contents/Home/bin/java", 
      "-Declipse.application=org.eclipse.jdt.ls.core.id1",
      "-Dosgi.bundles.defaultStartLevel=4",
      "-Declipse.product=org.eclipse.jdt.ls.core.product",
      "-Dlog.level=ALL",
      "-noverify",
      "-Xmx1G",
      "-jar /Users/hudengjun/github/jdt/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
      "-configuration /Users/hudengjun/github/jdt/config_mac",
      "-data /Users/data",
      "--add-modules=ALL-SYSTEM",
      "--add-opens java.base/java.util=ALL-UNNAMED",
      "--add-opens java.base/java.lang=ALL-UNNAMED"
  },
  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew','pom.xml'})
}
require('jdtls').start_or_attach(config)

