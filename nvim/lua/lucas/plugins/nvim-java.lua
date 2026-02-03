return {
  "nvim-java/nvim-java",
  ft = { "java" },
  config = function()
    local java = require("java")
    java.setup()

    vim.lsp.enable("jdtls", {
      root_markers = {
        "settings.gradle",
        "settings.gradle.kts",
        "pom.xml",
        "build.gradle",
        "mvnw",
        "gradlew",
        "build.gradle",
        "build.gradle.kts",
        ".git",
      },
    })
  end,
}
