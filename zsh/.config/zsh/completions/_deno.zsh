#compdef deno

_deno_commands() {
    local commands; commands=(
        'run:Run a JavaScript or TypeScript program, or a task'
        'watch:Run a JavaScript or TypeScript program, watching for file changes and hot-replacing modules'
        'serve:Run a server'
        'eval:Evaluate a script from the command line'
        'fmt:Format source files'
        'lint:Lint source files'
        'test:Run tests'
        'upgrade:Upgrade deno executable to given version'
        'cache:Cache the dependencies'
        'check:Type-check the dependencies'
        'info:Show info about cache or info related to source file'
        'doc:Generate and show documentation for a module or built-ins'
        'task:Run a task defined in the configuration file'
        'bench:Run benchmarks'
        'compile:Compile the script into a self contained executable'
        'coverage:Print coverage reports'
        'repl:Start an interactive Read-Eval-Print Loop (REPL) for Deno'
        'install:Installs dependencies either in the local project or globally to a bin directory'
        'uninstall:Uninstalls a dependency or an executable script in the installation root'\''s bin directory'
        'types:Print runtime TypeScript declarations'
        'completions:Generate shell completions'
        'init:Initialize a new project'
        'create:Create a project from a template'
        'jupyter:Deno kernel for Jupyter notebooks'
        'publish:Publish the current working directory'\''s package or workspace'
        'add:Add dependencies'
        'remove:Remove dependencies'
        'outdated:Find outdated dependencies'
        'update:Update outdated dependencies'
        'deploy:Deploy to Deno Deploy'
        'sandbox:Run in sandbox mode'
        'clean:Remove the cache directory'
        'list:List the dependencies declared in deno.json / package.json'
        'link:Link a local JSR package into the current project for development'
        'unlink:Remove a linked local package from the current project'
        'approve-scripts:Approve npm lifecycle scripts'
        'lsp:Start the language server'
        'vendor:`deno vendor` was removed in Deno 2.

See the Deno 1.x to 2.x Migration Guide for migration instructions: https://docs.deno.com/runtime/manual/advanced/migrate_deprecations'
        'bundle:Output a single JavaScript file with all dependencies'
        'audit:Audit currently installed dependencies'
        'why:Show why a package is installed'
        'transpile:Transpile TypeScript/JSX/TSX files to JavaScript'
        'bump-version:Update version in the configuration file'
        'ci:Install dependencies from a lockfile in a frozen state'
        'desktop:Compile a script into a desktop application'
        'pack:Create a tarball of the package'
        'x:Execute a binary from npm or jsr, like npx'
        'json_reference:'
    )
    _describe -t commands 'deno commands' commands
}

_deno() {
    local line state

    _arguments -C \
        '--env-file[Load environment variables from local file
  Only the first environment variable with a given key is used.
  Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.
  Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.]' \
        '(-h --help)'{-h,--help}'[Show help information]' \
        '(-V --version)'{-V,--version}'[Print version]' \
        '(-L --log-level)'{-L,--log-level}'[Set log level]' \
        '(-q --quiet)'{-q,--quiet}'[Suppress diagnostic output]' \
        ":: :_deno_commands" \
        "*::arg:->args" \
        && ret=0

    case $state in
    (args)
        case $line[1] in
        run)
            _arguments \
                '--check[Enable type-checking. This subcommand does not type-check by default; pass --check=all to also type-check remote modules. Alternatively, use the '\''deno check'\'' subcommand.]' \
                '--watch[Watch for file changes and restart process automatically.
  Local files from entry point module graph are watched by default.
  Additional paths might be watched by passing them as arguments to this flag.]' \
                '--hmr[Watch for file changes and hot-replace modules. The process restarts if hot replacement fails.
  Local files from entry point module graph are watched by default.
  Additional paths might be watched by passing them as arguments to this flag.]' \
                '--watch-exclude[Exclude provided files/patterns from watch mode]' \
                '--no-clear-screen[Do not clear terminal screen when under watch mode]' \
                '--ext[Set content type of the supplied file]' \
                '--env-file[Load environment variables from local file
  Only the first environment variable with a given key is used.
  Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.
  Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.]' \
                '--no-code-cache[Disable V8 code cache feature]' \
                '--coverage[Collect coverage profile data into DIR. If DIR is not specified, it uses '\''coverage/'\''.
  This option can also be set via the DENO_COVERAGE_DIR environment variable.]' \
                '--use-env-proxy[Use HTTP_PROXY, HTTPS_PROXY, and NO_PROXY for node:http/node:https]' \
                '--no-check[Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored]' \
                '--import-map[Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps]' \
                '--no-remote[Do not resolve remote modules]' \
                '--no-npm[Do not resolve npm modules]' \
                '--node-modules-dir[Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.]' \
                '--vendor[Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages]' \
                '--node-modules-linker[Sets the linker mode for npm packages (isolated or hoisted)]' \
                '--config[Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config]' \
                '--no-config[Disable automatic loading of the configuration file]' \
                '--reload[Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.]' \
                '--lock[Check the specified lock file. (If value is not provided, defaults to "./deno.lock")]' \
                '--no-lock[Disable auto discovery of the lock file]' \
                '--frozen-lockfile[Error out if lockfile is out of date]' \
                '--cert[Load certificate authority from PEM encoded file]' \
                '--unsafely-ignore-certificate-errors[DANGER: Disables verification of TLS certificates]' \
                '--min-dep-age[(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. '\''120'\'' for two hours, '\''P2D'\'' for two days, '\''2025-09-16'\'' for cutoff date, '\''2025-09-16T12:00:00+00:00'\'' for cutoff time, '\''0'\'' to disable)]' \
                '--inspect[Activate inspector on host:port [default: 127.0.0.1:9229]. Host and port are optional. Using port 0 will assign a random free port.]' \
                '--inspect-brk[Activate inspector on host:port, wait for debugger to connect and break at the start of user script]' \
                '--inspect-wait[Activate inspector on host:port and wait for debugger to connect before running user code]' \
                '--inspect-publish-uid[]' \
                '--cached-only[Require that remote dependencies are already cached]' \
                '--location[Value of globalThis.location used by some web APIs]' \
                '--v8-flags[To see a list of all available flags use --v8-flags=--help
  Flags can also be set via the DENO_V8_FLAGS environment variable.
  Any flags set with this flag are appended after the DENO_V8_FLAGS environment variable]' \
                '--seed[Set the random number generator seed]' \
                '--preload[A list of files that will be executed before the main module]' \
                '--require[A list of CommonJS modules that will be executed before the main module]' \
                '--conditions[Use this argument to specify custom conditions for npm package exports. You can also use DENO_CONDITIONS env var.

Docs: https://docs.deno.com/go/conditional-exports]' \
                '--allow-scripts[Allow running npm lifecycle scripts for the given packages
  Note: Scripts will only be executed when using a node_modules directory (`--node-modules-dir`)]' \
                '*:file:_files'
            ;;
        watch)
            _arguments \
                '--check[Enable type-checking. This subcommand does not type-check by default; pass --check=all to also type-check remote modules. Alternatively, use the '\''deno check'\'' subcommand.]' \
                '--watch[Watch for file changes and restart process automatically.
  Local files from entry point module graph are watched by default.
  Additional paths might be watched by passing them as arguments to this flag.]' \
                '--hmr[Watch for file changes and hot-replace modules. The process restarts if hot replacement fails.
  Local files from entry point module graph are watched by default.
  Additional paths might be watched by passing them as arguments to this flag.]' \
                '--watch-exclude[Exclude provided files/patterns from watch mode]' \
                '--no-clear-screen[Do not clear terminal screen when under watch mode]' \
                '--ext[Set content type of the supplied file]' \
                '--env-file[Load environment variables from local file
  Only the first environment variable with a given key is used.
  Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.
  Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.]' \
                '--no-code-cache[Disable V8 code cache feature]' \
                '--coverage[Collect coverage profile data into DIR. If DIR is not specified, it uses '\''coverage/'\''.
  This option can also be set via the DENO_COVERAGE_DIR environment variable.]' \
                '--use-env-proxy[Use HTTP_PROXY, HTTPS_PROXY, and NO_PROXY for node:http/node:https]' \
                '--no-check[Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored]' \
                '--import-map[Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps]' \
                '--no-remote[Do not resolve remote modules]' \
                '--no-npm[Do not resolve npm modules]' \
                '--node-modules-dir[Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.]' \
                '--vendor[Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages]' \
                '--node-modules-linker[Sets the linker mode for npm packages (isolated or hoisted)]' \
                '--config[Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config]' \
                '--no-config[Disable automatic loading of the configuration file]' \
                '--reload[Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.]' \
                '--lock[Check the specified lock file. (If value is not provided, defaults to "./deno.lock")]' \
                '--no-lock[Disable auto discovery of the lock file]' \
                '--frozen-lockfile[Error out if lockfile is out of date]' \
                '--cert[Load certificate authority from PEM encoded file]' \
                '--unsafely-ignore-certificate-errors[DANGER: Disables verification of TLS certificates]' \
                '--min-dep-age[(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. '\''120'\'' for two hours, '\''P2D'\'' for two days, '\''2025-09-16'\'' for cutoff date, '\''2025-09-16T12:00:00+00:00'\'' for cutoff time, '\''0'\'' to disable)]' \
                '--inspect[Activate inspector on host:port [default: 127.0.0.1:9229]. Host and port are optional. Using port 0 will assign a random free port.]' \
                '--inspect-brk[Activate inspector on host:port, wait for debugger to connect and break at the start of user script]' \
                '--inspect-wait[Activate inspector on host:port and wait for debugger to connect before running user code]' \
                '--inspect-publish-uid[]' \
                '--cached-only[Require that remote dependencies are already cached]' \
                '--location[Value of globalThis.location used by some web APIs]' \
                '--v8-flags[To see a list of all available flags use --v8-flags=--help
  Flags can also be set via the DENO_V8_FLAGS environment variable.
  Any flags set with this flag are appended after the DENO_V8_FLAGS environment variable]' \
                '--seed[Set the random number generator seed]' \
                '--preload[A list of files that will be executed before the main module]' \
                '--require[A list of CommonJS modules that will be executed before the main module]' \
                '--conditions[Use this argument to specify custom conditions for npm package exports. You can also use DENO_CONDITIONS env var.

Docs: https://docs.deno.com/go/conditional-exports]' \
                '--allow-scripts[Allow running npm lifecycle scripts for the given packages
  Note: Scripts will only be executed when using a node_modules directory (`--node-modules-dir`)]' \
                '*:file:_files'
            ;;
        serve)
            _arguments \
                '--port[The TCP port to serve on. Pass 0 to pick a random free port [default: 8000]]' \
                '--host[The TCP address to serve on, defaulting to 0.0.0.0 (all interfaces)]' \
                '--open[Open the browser on the address that the server is running on.]' \
                '--parallel[Run multiple server workers in parallel. Parallelism defaults to the number of available CPUs or the value of the DENO_JOBS environment variable]' \
                '--check[Enable type-checking. This subcommand does not type-check by default; pass --check=all to also type-check remote modules. Alternatively, use the '\''deno check'\'' subcommand.]' \
                '--watch[Watch for file changes and restart process automatically.
  Local files from entry point module graph are watched by default.
  Additional paths might be watched by passing them as arguments to this flag.]' \
                '--watch-hmr[Watch for file changes and hot-replace modules. The process restarts if hot replacement fails.
  Local files from entry point module graph are watched by default.
  Additional paths might be watched by passing them as arguments to this flag.]' \
                '--watch-exclude[Exclude provided files/patterns from watch mode]' \
                '--no-clear-screen[Do not clear terminal screen when under watch mode]' \
                '--ext[Set content type of the supplied file]' \
                '--env-file[Load environment variables from local file
  Only the first environment variable with a given key is used.
  Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.
  Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.]' \
                '--no-code-cache[Disable V8 code cache feature]' \
                '--no-check[Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored]' \
                '--import-map[Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps]' \
                '--no-remote[Do not resolve remote modules]' \
                '--no-npm[Do not resolve npm modules]' \
                '--node-modules-dir[Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.]' \
                '--vendor[Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages]' \
                '--node-modules-linker[Sets the linker mode for npm packages (isolated or hoisted)]' \
                '--config[Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config]' \
                '--no-config[Disable automatic loading of the configuration file]' \
                '--reload[Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.]' \
                '--lock[Check the specified lock file. (If value is not provided, defaults to "./deno.lock")]' \
                '--no-lock[Disable auto discovery of the lock file]' \
                '--frozen-lockfile[Error out if lockfile is out of date]' \
                '--cert[Load certificate authority from PEM encoded file]' \
                '--unsafely-ignore-certificate-errors[DANGER: Disables verification of TLS certificates]' \
                '--min-dep-age[(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. '\''120'\'' for two hours, '\''P2D'\'' for two days, '\''2025-09-16'\'' for cutoff date, '\''2025-09-16T12:00:00+00:00'\'' for cutoff time, '\''0'\'' to disable)]' \
                '--inspect[Activate inspector on host:port [default: 127.0.0.1:9229]. Host and port are optional. Using port 0 will assign a random free port.]' \
                '--inspect-brk[Activate inspector on host:port, wait for debugger to connect and break at the start of user script]' \
                '--inspect-wait[Activate inspector on host:port and wait for debugger to connect before running user code]' \
                '--inspect-publish-uid[]' \
                '--cached-only[Require that remote dependencies are already cached]' \
                '--location[Value of globalThis.location used by some web APIs]' \
                '--v8-flags[To see a list of all available flags use --v8-flags=--help
  Flags can also be set via the DENO_V8_FLAGS environment variable.
  Any flags set with this flag are appended after the DENO_V8_FLAGS environment variable]' \
                '--seed[Set the random number generator seed]' \
                '--preload[A list of files that will be executed before the main module]' \
                '--require[A list of CommonJS modules that will be executed before the main module]' \
                '--conditions[Use this argument to specify custom conditions for npm package exports. You can also use DENO_CONDITIONS env var.

Docs: https://docs.deno.com/go/conditional-exports]' \
                '--allow-scripts[Allow running npm lifecycle scripts for the given packages
  Note: Scripts will only be executed when using a node_modules directory (`--node-modules-dir`)]' \
                '*:file:_files'
            ;;
        eval)
            _arguments \
                '--print[print result to stdout]' \
                '--ext[Set content type of the supplied file]' \
                '--env-file[Load environment variables from local file
  Only the first environment variable with a given key is used.
  Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.
  Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.]' \
                '--check[Enable type-checking. This subcommand does not type-check by default; pass --check=all to also type-check remote modules. Alternatively, use the '\''deno check'\'' subcommand.]' \
                '--no-check[Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored]' \
                '--import-map[Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps]' \
                '--no-remote[Do not resolve remote modules]' \
                '--no-npm[Do not resolve npm modules]' \
                '--node-modules-dir[Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.]' \
                '--vendor[Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages]' \
                '--node-modules-linker[Sets the linker mode for npm packages (isolated or hoisted)]' \
                '--config[Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config]' \
                '--no-config[Disable automatic loading of the configuration file]' \
                '--reload[Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.]' \
                '--lock[Check the specified lock file. (If value is not provided, defaults to "./deno.lock")]' \
                '--no-lock[Disable auto discovery of the lock file]' \
                '--frozen-lockfile[Error out if lockfile is out of date]' \
                '--cert[Load certificate authority from PEM encoded file]' \
                '--unsafely-ignore-certificate-errors[DANGER: Disables verification of TLS certificates]' \
                '--min-dep-age[(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. '\''120'\'' for two hours, '\''P2D'\'' for two days, '\''2025-09-16'\'' for cutoff date, '\''2025-09-16T12:00:00+00:00'\'' for cutoff time, '\''0'\'' to disable)]' \
                '--inspect[Activate inspector on host:port [default: 127.0.0.1:9229]. Host and port are optional. Using port 0 will assign a random free port.]' \
                '--inspect-brk[Activate inspector on host:port, wait for debugger to connect and break at the start of user script]' \
                '--inspect-wait[Activate inspector on host:port and wait for debugger to connect before running user code]' \
                '--inspect-publish-uid[]' \
                '--cached-only[Require that remote dependencies are already cached]' \
                '--location[Value of globalThis.location used by some web APIs]' \
                '--v8-flags[To see a list of all available flags use --v8-flags=--help
  Flags can also be set via the DENO_V8_FLAGS environment variable.
  Any flags set with this flag are appended after the DENO_V8_FLAGS environment variable]' \
                '--seed[Set the random number generator seed]' \
                '--preload[A list of files that will be executed before the main module]' \
                '--require[A list of CommonJS modules that will be executed before the main module]' \
                '--conditions[Use this argument to specify custom conditions for npm package exports. You can also use DENO_CONDITIONS env var.

Docs: https://docs.deno.com/go/conditional-exports]' \
                '*:file:_files'
            ;;
        fmt)
            _arguments \
                '--check[Check if the source files are formatted]' \
                '--fail-fast[Stop checking files on first format error]' \
                '--permit-no-files[Don'\''t return an error code if no files were found]' \
                '--watch[Watch for file changes and restart process automatically.
  Local files from entry point module graph are watched by default.
  Additional paths might be watched by passing them as arguments to this flag.]' \
                '--watch-exclude[Exclude provided files/patterns from watch mode]' \
                '--no-clear-screen[Do not clear terminal screen when under watch mode]' \
                '--ext[Set content type of the supplied file]' \
                '--ignore[Ignore formatting particular source files]' \
                '--use-tabs[Use tabs instead of spaces for indentation [default: false]]' \
                '--line-width[Define maximum line width [default: 80]]' \
                '--indent-width[Define indentation width [default: 2]]' \
                '--single-quote[Use single quotes [default: false]]' \
                '--prose-wrap[Define how prose should be wrapped [default: always]]' \
                '--no-semicolons[Don'\''t use semicolons except where necessary [default: false]]' \
                '--config[Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config]' \
                '--no-config[Disable automatic loading of the configuration file]' \
                '--no-editorconfig[Don'\''t read .editorconfig files to infer formatting options [default: false]]' \
                '--unstable-component[Enable formatting Svelte, Vue, Astro and Angular files]' \
                '--unstable-sql[Enable formatting SQL files.]' \
                '*:file:_files'
            ;;
        lint)
            _arguments \
                '--rules[List available rules]' \
                '--fix[Fix any linting errors for rules that support it]' \
                '--rules-tags[Use set of rules with a tag]' \
                '--rules-include[Include lint rules]' \
                '--rules-exclude[Exclude lint rules]' \
                '--json[Output lint result in JSON format]' \
                '--compact[Output lint result in compact format]' \
                '--ignore[Ignore linting particular source files]' \
                '--watch[Watch for file changes and restart process automatically.
  Local files from entry point module graph are watched by default.
  Additional paths might be watched by passing them as arguments to this flag.]' \
                '--watch-exclude[Exclude provided files/patterns from watch mode]' \
                '--no-clear-screen[Do not clear terminal screen when under watch mode]' \
                '--permit-no-files[Don'\''t return an error code if no files were found]' \
                '--config[Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config]' \
                '--no-config[Disable automatic loading of the configuration file]' \
                '--ext[Specify the file extension to lint when reading from stdin.For example, use `jsx` to lint JSX files or `tsx` for TSX files.This argument is necessary because stdin input does not automatically infer the file type.Example usage: `cat file.jsx | deno lint - --ext=jsx`.]' \
                '--allow-import[Allow importing from remote hosts. Optionally specify allowed IP addresses and host names, with ports as necessary. Default value: deno.land:443,jsr.io:443,esm.sh:443,raw.esm.sh:443,cdn.jsdelivr.net:443,raw.githubusercontent.com:443,gist.githubusercontent.com:443]' \
                '--deny-import[Deny importing from remote hosts. Optionally specify denied IP addresses and host names, with ports as necessary.]' \
                '*:file:_files'
            ;;
        test)
            _arguments \
                '--doc[Evaluate code blocks in JSDoc and Markdown]' \
                '--no-run[Cache test modules, but don'\''t run tests]' \
                '--coverage[Collect coverage profile data into DIR. If DIR is not specified, it uses '\''coverage/'\''.
  This option can also be set via the DENO_COVERAGE_DIR environment variable.]' \
                '--clean[Empty the temporary coverage profile data directory before running tests.
  Note: running multiple `deno test --clean` calls in series or parallel for the same coverage directory may cause race conditions.]' \
                '--fail-fast[Stop after N errors. Defaults to stopping after first failure]' \
                '--filter[Run tests with this string or regexp pattern in the test name]' \
                '--shuffle[Shuffle the order in which the tests are run]' \
                '--parallel[Run test modules in parallel. Parallelism defaults to the number of available CPUs or the value of the DENO_JOBS environment variable]' \
                '--sanitize-ops[Enable the ops sanitizer, which ensures that all async ops started in a test are completed before the test ends]' \
                '--sanitize-resources[Enable the resources sanitizer, which ensures that all resources opened in a test are closed before the test ends]' \
                '--coverage-threshold[Fail if coverage is below this percentage (0-100). Requires --coverage]' \
                '--update-snapshots[Update snapshots created with `t.assertSnapshot()` instead of failing when they do not match]' \
                '--watch[Watch for file changes and restart process automatically.
  Local files from entry point module graph are watched by default.
  Additional paths might be watched by passing them as arguments to this flag.]' \
                '--watch-exclude[Exclude provided files/patterns from watch mode]' \
                '--no-clear-screen[Do not clear terminal screen when under watch mode]' \
                '--reporter[Select reporter to use. Default to '\''pretty'\'']' \
                '--junit-path[Write a JUnit XML test report to PATH. Use '\''-'\'' to write to stdout which is the default when PATH is not provided]' \
                '--hide-stacktraces[Hide stack traces for errors in failure test results.]' \
                '--retry[Re-run failing tests up to NUMBER times. A test passes if any attempt passes. Tests that set their own `retry` option take precedence]' \
                '--repeats[Run each test NUMBER additional times. Every repetition must pass. Tests that set their own `repeats` option take precedence]' \
                '--shard[Run only the test files for shard INDEX of COUNT, e.g. --shard=2/3.
  The discovered test files are sorted and split into COUNT consecutive groups; INDEX is 1-based. Useful for splitting a run across machines.]' \
                '--changed[Run only test modules affected by files changed in git.
  With no value, uses uncommitted changes (staged, unstaged and untracked).
  Pass a git ref to compare against, e.g. --changed=main or --changed=HEAD~1.]' \
                '--related[Run only test modules that depend on the given source files]' \
                '--coverage-raw-data-only[Only collect raw coverage data, without generating a report]' \
                '--ignore[Ignore files]' \
                '--env-file[Load environment variables from local file
  Only the first environment variable with a given key is used.
  Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.
  Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.]' \
                '--permit-no-files[Don'\''t return an error code if no files were found]' \
                '--ext[Set content type of the supplied file]' \
                '--check[Set type-checking behavior. This subcommand type-checks local modules by default, so passing --check is redundant; pass --check=all to also type-check remote modules. Alternatively, use the '\''deno check'\'' subcommand.]' \
                '--no-check[Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored]' \
                '--import-map[Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps]' \
                '--no-remote[Do not resolve remote modules]' \
                '--no-npm[Do not resolve npm modules]' \
                '--node-modules-dir[Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.]' \
                '--vendor[Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages]' \
                '--node-modules-linker[Sets the linker mode for npm packages (isolated or hoisted)]' \
                '--config[Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config]' \
                '--no-config[Disable automatic loading of the configuration file]' \
                '--reload[Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.]' \
                '--lock[Check the specified lock file. (If value is not provided, defaults to "./deno.lock")]' \
                '--no-lock[Disable auto discovery of the lock file]' \
                '--frozen-lockfile[Error out if lockfile is out of date]' \
                '--cert[Load certificate authority from PEM encoded file]' \
                '--unsafely-ignore-certificate-errors[DANGER: Disables verification of TLS certificates]' \
                '--min-dep-age[(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. '\''120'\'' for two hours, '\''P2D'\'' for two days, '\''2025-09-16'\'' for cutoff date, '\''2025-09-16T12:00:00+00:00'\'' for cutoff time, '\''0'\'' to disable)]' \
                '--inspect[Activate inspector on host:port [default: 127.0.0.1:9229]. Host and port are optional. Using port 0 will assign a random free port.]' \
                '--inspect-brk[Activate inspector on host:port, wait for debugger to connect and break at the start of user script]' \
                '--inspect-wait[Activate inspector on host:port and wait for debugger to connect before running user code]' \
                '--inspect-publish-uid[]' \
                '--cached-only[Require that remote dependencies are already cached]' \
                '--location[Value of globalThis.location used by some web APIs]' \
                '--v8-flags[To see a list of all available flags use --v8-flags=--help
  Flags can also be set via the DENO_V8_FLAGS environment variable.
  Any flags set with this flag are appended after the DENO_V8_FLAGS environment variable]' \
                '--seed[Set the random number generator seed]' \
                '--preload[A list of files that will be executed before the main module]' \
                '--require[A list of CommonJS modules that will be executed before the main module]' \
                '--conditions[Use this argument to specify custom conditions for npm package exports. You can also use DENO_CONDITIONS env var.

Docs: https://docs.deno.com/go/conditional-exports]' \
                '--allow-scripts[Allow running npm lifecycle scripts for the given packages
  Note: Scripts will only be executed when using a node_modules directory (`--node-modules-dir`)]' \
                '*:file:_files'
            ;;
        upgrade)
            _arguments \
                '--dry-run[Perform all checks without replacing old exe]' \
                '--force[Replace current exe even if not out-of-date]' \
                '--canary[Upgrade to canary builds]' \
                '--release-candidate[Upgrade to a release candidate]' \
                '--version[The version to upgrade to]' \
                '--output[The path to output the updated version to]' \
                '--cert[Load certificate authority from PEM encoded file]' \
                '--unsafely-ignore-certificate-errors[DANGER: Disables verification of TLS certificates]' \
                '--pr[]' \
                '--checksum[Verify the downloaded archive against the provided SHA256 checksum]' \
                '--branch[]' \
                '--no-delta[Disable delta updates and always download the full archive]' \
                '*:file:_files'
            ;;
        cache)
            _arguments \
                '--check[Enable type-checking. This subcommand does not type-check by default; pass --check=all to also type-check remote modules. Alternatively, use the '\''deno check'\'' subcommand.]' \
                '--ext[]' \
                '--env-file[Load environment variables from local file
  Only the first environment variable with a given key is used.
  Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.
  Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.]' \
                '--no-check[Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored]' \
                '--import-map[Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps]' \
                '--no-remote[Do not resolve remote modules]' \
                '--no-npm[Do not resolve npm modules]' \
                '--node-modules-dir[Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.]' \
                '--vendor[Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages]' \
                '--node-modules-linker[Sets the linker mode for npm packages (isolated or hoisted)]' \
                '--config[Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config]' \
                '--no-config[Disable automatic loading of the configuration file]' \
                '--reload[Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.]' \
                '--lock[Check the specified lock file. (If value is not provided, defaults to "./deno.lock")]' \
                '--no-lock[Disable auto discovery of the lock file]' \
                '--frozen-lockfile[Error out if lockfile is out of date]' \
                '--cert[Load certificate authority from PEM encoded file]' \
                '--unsafely-ignore-certificate-errors[DANGER: Disables verification of TLS certificates]' \
                '--min-dep-age[(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. '\''120'\'' for two hours, '\''P2D'\'' for two days, '\''2025-09-16'\'' for cutoff date, '\''2025-09-16T12:00:00+00:00'\'' for cutoff time, '\''0'\'' to disable)]' \
                '--inspect[Activate inspector on host:port [default: 127.0.0.1:9229]. Host and port are optional. Using port 0 will assign a random free port.]' \
                '--inspect-brk[Activate inspector on host:port, wait for debugger to connect and break at the start of user script]' \
                '--inspect-wait[Activate inspector on host:port and wait for debugger to connect before running user code]' \
                '--inspect-publish-uid[]' \
                '--allow-import[Allow importing from remote hosts. Optionally specify allowed IP addresses and host names, with ports as necessary. Default value: deno.land:443,jsr.io:443,esm.sh:443,raw.esm.sh:443,cdn.jsdelivr.net:443,raw.githubusercontent.com:443,gist.githubusercontent.com:443]' \
                '--deny-import[Deny importing from remote hosts. Optionally specify denied IP addresses and host names, with ports as necessary.]' \
                '--allow-scripts[Allow running npm lifecycle scripts for the given packages
  Note: Scripts will only be executed when using a node_modules directory (`--node-modules-dir`)]' \
                '*:file:_files'
            ;;
        check)
            _arguments \
                '--all[Type-check all code, including remote modules and npm packages]' \
                '--doc[Type-check code blocks in JSDoc as well as actual code]' \
                '--doc-only[Type-check code blocks in JSDoc and Markdown only]' \
                '--desktop[Type-check using the type definitions for `deno desktop`]' \
                '--no-code-cache[Disable V8 code cache feature]' \
                '--watch[Watch for file changes and restart process automatically.
  Only local files from entry point module graph are watched.]' \
                '--watch-exclude[Exclude provided files/patterns from watch mode]' \
                '--no-clear-screen[Do not clear terminal screen when under watch mode]' \
                '--no-check[Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored]' \
                '--import-map[Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps]' \
                '--no-remote[Do not resolve remote modules]' \
                '--no-npm[Do not resolve npm modules]' \
                '--node-modules-dir[Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.]' \
                '--vendor[Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages]' \
                '--node-modules-linker[Sets the linker mode for npm packages (isolated or hoisted)]' \
                '--config[Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config]' \
                '--no-config[Disable automatic loading of the configuration file]' \
                '--reload[Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.]' \
                '--lock[Check the specified lock file. (If value is not provided, defaults to "./deno.lock")]' \
                '--no-lock[Disable auto discovery of the lock file]' \
                '--frozen-lockfile[Error out if lockfile is out of date]' \
                '--cert[Load certificate authority from PEM encoded file]' \
                '--unsafely-ignore-certificate-errors[DANGER: Disables verification of TLS certificates]' \
                '--min-dep-age[(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. '\''120'\'' for two hours, '\''P2D'\'' for two days, '\''2025-09-16'\'' for cutoff date, '\''2025-09-16T12:00:00+00:00'\'' for cutoff time, '\''0'\'' to disable)]' \
                '--cached-only[Require that remote dependencies are already cached]' \
                '--location[Value of globalThis.location used by some web APIs]' \
                '--v8-flags[To see a list of all available flags use --v8-flags=--help
  Flags can also be set via the DENO_V8_FLAGS environment variable.
  Any flags set with this flag are appended after the DENO_V8_FLAGS environment variable]' \
                '--seed[Set the random number generator seed]' \
                '--preload[A list of files that will be executed before the main module]' \
                '--require[A list of CommonJS modules that will be executed before the main module]' \
                '--conditions[Use this argument to specify custom conditions for npm package exports. You can also use DENO_CONDITIONS env var.

Docs: https://docs.deno.com/go/conditional-exports]' \
                '--allow-import[Allow importing from remote hosts. Optionally specify allowed IP addresses and host names, with ports as necessary. Default value: deno.land:443,jsr.io:443,esm.sh:443,raw.esm.sh:443,cdn.jsdelivr.net:443,raw.githubusercontent.com:443,gist.githubusercontent.com:443]' \
                '--deny-import[Deny importing from remote hosts. Optionally specify denied IP addresses and host names, with ports as necessary.]' \
                '*:file:_files'
            ;;
        info)
            _arguments \
                '--json[UNSTABLE: Outputs the information in JSON format]' \
                '--location[Show files used for origin bound APIs like the Web Storage API when running a script with --location=<HREF>]' \
                '--no-check[Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored]' \
                '--import-map[Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps]' \
                '--no-remote[Do not resolve remote modules]' \
                '--no-npm[Do not resolve npm modules]' \
                '--node-modules-dir[Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.]' \
                '--vendor[Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages]' \
                '--node-modules-linker[Sets the linker mode for npm packages (isolated or hoisted)]' \
                '--config[Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config]' \
                '--no-config[Disable automatic loading of the configuration file]' \
                '--reload[Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.]' \
                '--lock[Check the specified lock file. (If value is not provided, defaults to "./deno.lock")]' \
                '--no-lock[Disable auto discovery of the lock file]' \
                '--frozen-lockfile[Error out if lockfile is out of date]' \
                '--cert[Load certificate authority from PEM encoded file]' \
                '--unsafely-ignore-certificate-errors[DANGER: Disables verification of TLS certificates]' \
                '--min-dep-age[(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. '\''120'\'' for two hours, '\''P2D'\'' for two days, '\''2025-09-16'\'' for cutoff date, '\''2025-09-16T12:00:00+00:00'\'' for cutoff time, '\''0'\'' to disable)]' \
                '--allow-import[Allow importing from remote hosts. Optionally specify allowed IP addresses and host names, with ports as necessary. Default value: deno.land:443,jsr.io:443,esm.sh:443,raw.esm.sh:443,cdn.jsdelivr.net:443,raw.githubusercontent.com:443,gist.githubusercontent.com:443]' \
                '--deny-import[Deny importing from remote hosts. Optionally specify denied IP addresses and host names, with ports as necessary.]' \
                '*:file:_files'
            ;;
        doc)
            _arguments \
                '--json[Output documentation in JSON format]' \
                '--private[Output private documentation]' \
                '--lint[Output documentation diagnostics.]' \
                '--html[Output documentation in HTML format]' \
                '--name[The name that will be used in the docs (ie for breadcrumbs)]' \
                '--output[Directory for HTML documentation output]' \
                '--category-docs[Path to a JSON file keyed by category and an optional value of a markdown doc]' \
                '--symbol-redirect-map[Path to a JSON file keyed by file, with an inner map of symbol to an external link]' \
                '--default-symbol-map[Uses the provided mapping of default name to wanted name for usage blocks]' \
                '--strip-trailing-html[Remove trailing .html from various links. Will still generate files with a .html extension]' \
                '--filter[Dot separated path to symbol]' \
                '--builtin[]' \
                '--no-check[Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored]' \
                '--import-map[Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps]' \
                '--no-remote[Do not resolve remote modules]' \
                '--no-npm[Do not resolve npm modules]' \
                '--node-modules-dir[Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.]' \
                '--vendor[Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages]' \
                '--node-modules-linker[Sets the linker mode for npm packages (isolated or hoisted)]' \
                '--config[Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config]' \
                '--no-config[Disable automatic loading of the configuration file]' \
                '--reload[Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.]' \
                '--lock[Check the specified lock file. (If value is not provided, defaults to "./deno.lock")]' \
                '--no-lock[Disable auto discovery of the lock file]' \
                '--frozen-lockfile[Error out if lockfile is out of date]' \
                '--cert[Load certificate authority from PEM encoded file]' \
                '--unsafely-ignore-certificate-errors[DANGER: Disables verification of TLS certificates]' \
                '--min-dep-age[(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. '\''120'\'' for two hours, '\''P2D'\'' for two days, '\''2025-09-16'\'' for cutoff date, '\''2025-09-16T12:00:00+00:00'\'' for cutoff time, '\''0'\'' to disable)]' \
                '--allow-import[Allow importing from remote hosts. Optionally specify allowed IP addresses and host names, with ports as necessary. Default value: deno.land:443,jsr.io:443,esm.sh:443,raw.esm.sh:443,cdn.jsdelivr.net:443,raw.githubusercontent.com:443,gist.githubusercontent.com:443]' \
                '--deny-import[Deny importing from remote hosts. Optionally specify denied IP addresses and host names, with ports as necessary.]' \
                '*:file:_files'
            ;;
        task)
            _arguments \
                '--cwd[Specify the directory to run the task in]' \
                '--config[Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config]' \
                '--recursive[Run the task in all projects in the workspace]' \
                '--members[Run the task in all workspace members, but not in the workspace root]' \
                '--filter[Filter members of the workspace by name, implies --recursive flag]' \
                '--eval[Evaluate the passed value as if it was a task in a configuration file]' \
                '--if-present[Exit with code 0 instead of an error when the task is not found]' \
                '--no-prefix[Disable prefixing the output of concurrently-executing tasks with the task name]' \
                '--jobs[Maximum number of tasks to run concurrently.
Overrides the DENO_JOBS environment variable; defaults to the number of
available CPUs. Use 1 to force sequential execution. Only affects runs
where multiple tasks can run concurrently (workspace runs, or a task with
parallelizable dependencies)]' \
                '--env-file[Load environment variables from local file
  Only the first environment variable with a given key is used.
  Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.
  Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.]' \
                '--node-modules-dir[Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.]' \
                '--lock[Check the specified lock file. (If value is not provided, defaults to "./deno.lock")]' \
                '--no-lock[Disable auto discovery of the lock file]' \
                '--frozen-lockfile[Error out if lockfile is out of date]' \
                '*:file:_files'
            ;;
        bench)
            _arguments \
                '--filter[Run benchmarks with this string or regexp pattern in the bench name]' \
                '--json[UNSTABLE: Output benchmark result in JSON format]' \
                '--no-run[Cache bench modules, but don'\''t run benchmarks]' \
                '--permit-no-files[Don'\''t return an error code if no files were found]' \
                '--watch[Watch for file changes and restart process automatically.
  Local files from entry point module graph are watched by default.
  Additional paths might be watched by passing them as arguments to this flag.]' \
                '--watch-exclude[Exclude provided files/patterns from watch mode]' \
                '--no-clear-screen[Do not clear terminal screen when under watch mode]' \
                '--ignore[Ignore files]' \
                '--env-file[Load environment variables from local file
  Only the first environment variable with a given key is used.
  Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.
  Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.]' \
                '--check[Set type-checking behavior. This subcommand type-checks local modules by default, so passing --check is redundant; pass --check=all to also type-check remote modules. Alternatively, use the '\''deno check'\'' subcommand.]' \
                '--ext[Set content type of the supplied file]' \
                '--no-check[Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored]' \
                '--import-map[Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps]' \
                '--no-remote[Do not resolve remote modules]' \
                '--no-npm[Do not resolve npm modules]' \
                '--node-modules-dir[Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.]' \
                '--vendor[Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages]' \
                '--node-modules-linker[Sets the linker mode for npm packages (isolated or hoisted)]' \
                '--config[Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config]' \
                '--no-config[Disable automatic loading of the configuration file]' \
                '--reload[Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.]' \
                '--lock[Check the specified lock file. (If value is not provided, defaults to "./deno.lock")]' \
                '--no-lock[Disable auto discovery of the lock file]' \
                '--frozen-lockfile[Error out if lockfile is out of date]' \
                '--cert[Load certificate authority from PEM encoded file]' \
                '--unsafely-ignore-certificate-errors[DANGER: Disables verification of TLS certificates]' \
                '--min-dep-age[(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. '\''120'\'' for two hours, '\''P2D'\'' for two days, '\''2025-09-16'\'' for cutoff date, '\''2025-09-16T12:00:00+00:00'\'' for cutoff time, '\''0'\'' to disable)]' \
                '--inspect[Activate inspector on host:port [default: 127.0.0.1:9229]. Host and port are optional. Using port 0 will assign a random free port.]' \
                '--inspect-brk[Activate inspector on host:port, wait for debugger to connect and break at the start of user script]' \
                '--inspect-wait[Activate inspector on host:port and wait for debugger to connect before running user code]' \
                '--inspect-publish-uid[]' \
                '--cached-only[Require that remote dependencies are already cached]' \
                '--location[Value of globalThis.location used by some web APIs]' \
                '--v8-flags[To see a list of all available flags use --v8-flags=--help
  Flags can also be set via the DENO_V8_FLAGS environment variable.
  Any flags set with this flag are appended after the DENO_V8_FLAGS environment variable]' \
                '--seed[Set the random number generator seed]' \
                '--preload[A list of files that will be executed before the main module]' \
                '--require[A list of CommonJS modules that will be executed before the main module]' \
                '--conditions[Use this argument to specify custom conditions for npm package exports. You can also use DENO_CONDITIONS env var.

Docs: https://docs.deno.com/go/conditional-exports]' \
                '*:file:_files'
            ;;
        compile)
            _arguments \
                '--output[Output file (defaults to $PWD/<inferred-name>)]' \
                '--target[Target OS architecture]' \
                '--engine[JS engine the compiled binary runs on (quickjs is smaller and experimental, and does not receive the same security updates as v8)]' \
                '--no-terminal[Hide terminal on Windows]' \
                '--icon[Set the icon of the executable on Windows (.ico)]' \
                '--include[Includes an additional module or file/directory in the compiled executable.
  Use this flag if a dynamically imported module or a web worker main module
  fails to load in the executable or to embed a file or directory in the executable.
  This flag can be passed multiple times, to include multiple additional modules.]' \
                '--exclude[Excludes a file/directory in the compiled executable.
  Use this flag to exclude a specific file or directory within the included files.
  For example, to exclude a certain folder in the bundled node_modules directory.]' \
                '--env-file[Load environment variables from local file
  Only the first environment variable with a given key is used.
  Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.
  Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.]' \
                '--no-code-cache[Disable V8 code cache feature]' \
                '--ext[Set content type of the supplied file]' \
                '--self-extracting[Create a self-extracting binary that extracts the embedded file system to disk on first run and then runs from there]' \
                '--bundle[Experimental. Bundle the entrypoint with esbuild before embedding, instead of shipping the whole node_modules tree.
  Produces a smaller binary with faster startup, at the cost of dropping dynamic require/import patterns that can'\''t be statically traced.]' \
                '--minify[Experimental. Minify the bundled output. Only meaningful with --bundle.
  Reduces both the embedded bundle size and runtime memory use, at the cost of less readable stack traces.]' \
                '--app-name[Stable identity for the compiled app.
  Determines where origin-bound storage such as the default `Deno.openKv()`,
  `localStorage` and `caches` is persisted (under the platform'\''s app data directory).
  Defaults to the output file name. Set this to keep storage stable across renames.]' \
                '--exclude-unused-npm[Embed only the npm packages reachable from the module graph (managed npm; no node_modules directory).
  Without this flag the full managed npm snapshot from the lockfile / package.json is embedded.
  Reduces binary size when the lockfile contains packages the entrypoint does not import.
  Skips packages that are only reached through non-statically-analyzable dynamic imports;
  pass those with --include npm:<pkg> if needed.]' \
                '--check[Set type-checking behavior. This subcommand type-checks local modules by default, so passing --check is redundant; pass --check=all to also type-check remote modules. Alternatively, use the '\''deno check'\'' subcommand.]' \
                '--watch[Watch for file changes and restart process automatically.
  Only local files from entry point module graph are watched.]' \
                '--watch-exclude[Exclude provided files/patterns from watch mode]' \
                '--no-clear-screen[Do not clear terminal screen when under watch mode]' \
                '--no-check[Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored]' \
                '--import-map[Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps]' \
                '--no-remote[Do not resolve remote modules]' \
                '--no-npm[Do not resolve npm modules]' \
                '--node-modules-dir[Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.]' \
                '--vendor[Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages]' \
                '--node-modules-linker[Sets the linker mode for npm packages (isolated or hoisted)]' \
                '--config[Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config]' \
                '--no-config[Disable automatic loading of the configuration file]' \
                '--reload[Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.]' \
                '--lock[Check the specified lock file. (If value is not provided, defaults to "./deno.lock")]' \
                '--no-lock[Disable auto discovery of the lock file]' \
                '--frozen-lockfile[Error out if lockfile is out of date]' \
                '--cert[Load certificate authority from PEM encoded file]' \
                '--unsafely-ignore-certificate-errors[DANGER: Disables verification of TLS certificates]' \
                '--min-dep-age[(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. '\''120'\'' for two hours, '\''P2D'\'' for two days, '\''2025-09-16'\'' for cutoff date, '\''2025-09-16T12:00:00+00:00'\'' for cutoff time, '\''0'\'' to disable)]' \
                '--inspect[Activate inspector on host:port [default: 127.0.0.1:9229]. Host and port are optional. Using port 0 will assign a random free port.]' \
                '--inspect-brk[Activate inspector on host:port, wait for debugger to connect and break at the start of user script]' \
                '--inspect-wait[Activate inspector on host:port and wait for debugger to connect before running user code]' \
                '--inspect-publish-uid[]' \
                '--cached-only[Require that remote dependencies are already cached]' \
                '--location[Value of globalThis.location used by some web APIs]' \
                '--v8-flags[To see a list of all available flags use --v8-flags=--help
  Flags can also be set via the DENO_V8_FLAGS environment variable.
  Any flags set with this flag are appended after the DENO_V8_FLAGS environment variable]' \
                '--seed[Set the random number generator seed]' \
                '--preload[A list of files that will be executed before the main module]' \
                '--require[A list of CommonJS modules that will be executed before the main module]' \
                '--conditions[Use this argument to specify custom conditions for npm package exports. You can also use DENO_CONDITIONS env var.

Docs: https://docs.deno.com/go/conditional-exports]' \
                '*:file:_files'
            ;;
        coverage)
            _arguments \
                '--ignore[Ignore coverage files]' \
                '--include[Include source files in the report]' \
                '--exclude[Exclude source files from the report]' \
                '--lcov[Output coverage report in lcov format]' \
                '--html[Output coverage report in HTML format in the given directory]' \
                '--detailed[Output coverage report in detailed format in the terminal]' \
                '--threshold[Fail if coverage is below this percentage (0-100), applied to line, branch, and function coverage.
  Per-metric thresholds can be set in deno.json under "coverage": { "thresholds": { ... } }. The flag takes precedence.]' \
                '--output[Exports the coverage report in lcov format to the given file.
  If no --output arg is specified then the report is written to stdout.]' \
                '*:file:_files'
            ;;
        repl)
            _arguments \
                '--eval[Evaluates the provided code when the REPL starts]' \
                '--eval-file[Evaluates the provided file(s) as scripts when the REPL starts. Accepts file paths and URLs]' \
                '--json[]' \
                '--env-file[Load environment variables from local file
  Only the first environment variable with a given key is used.
  Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.
  Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.]' \
                '--no-check[Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored]' \
                '--import-map[Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps]' \
                '--no-remote[Do not resolve remote modules]' \
                '--no-npm[Do not resolve npm modules]' \
                '--node-modules-dir[Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.]' \
                '--vendor[Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages]' \
                '--node-modules-linker[Sets the linker mode for npm packages (isolated or hoisted)]' \
                '--config[Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config]' \
                '--no-config[Disable automatic loading of the configuration file]' \
                '--reload[Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.]' \
                '--lock[Check the specified lock file. (If value is not provided, defaults to "./deno.lock")]' \
                '--no-lock[Disable auto discovery of the lock file]' \
                '--frozen-lockfile[Error out if lockfile is out of date]' \
                '--cert[Load certificate authority from PEM encoded file]' \
                '--unsafely-ignore-certificate-errors[DANGER: Disables verification of TLS certificates]' \
                '--min-dep-age[(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. '\''120'\'' for two hours, '\''P2D'\'' for two days, '\''2025-09-16'\'' for cutoff date, '\''2025-09-16T12:00:00+00:00'\'' for cutoff time, '\''0'\'' to disable)]' \
                '--inspect[Activate inspector on host:port [default: 127.0.0.1:9229]. Host and port are optional. Using port 0 will assign a random free port.]' \
                '--inspect-brk[Activate inspector on host:port, wait for debugger to connect and break at the start of user script]' \
                '--inspect-wait[Activate inspector on host:port and wait for debugger to connect before running user code]' \
                '--inspect-publish-uid[]' \
                '--cached-only[Require that remote dependencies are already cached]' \
                '--location[Value of globalThis.location used by some web APIs]' \
                '--v8-flags[To see a list of all available flags use --v8-flags=--help
  Flags can also be set via the DENO_V8_FLAGS environment variable.
  Any flags set with this flag are appended after the DENO_V8_FLAGS environment variable]' \
                '--seed[Set the random number generator seed]' \
                '--preload[A list of files that will be executed before the main module]' \
                '--require[A list of CommonJS modules that will be executed before the main module]' \
                '--conditions[Use this argument to specify custom conditions for npm package exports. You can also use DENO_CONDITIONS env var.

Docs: https://docs.deno.com/go/conditional-exports]' \
                '*:file:_files'
            ;;
        install)
            _arguments \
                '--global[Install a package or script as a globally available executable]' \
                '--name[Executable file name]' \
                '--root[Installation root]' \
                '--force[Forcefully overwrite existing installation]' \
                '--dev[Add the package as a dev dependency (under `devDependencies`). Note: this only applies when adding to a `package.json` file.]' \
                '--save-optional[Add the package as an optional dependency (under `optionalDependencies`). Note: this only applies when adding to a `package.json` file.]' \
                '--no-save[Install the package(s) without adding them to the configuration file.]' \
                '--prod[Only install production dependencies (excludes devDependencies)]' \
                '--skip-types[Exclude @types/* packages from installation.
Be careful, as it uses a name-based heuristic and may skip packages that ship runtime code.]' \
                '--entrypoint[Install dependents of the specified entrypoint(s)]' \
                '--compile[Install the script as a compiled executable]' \
                '--lockfile-only[Install only updating the lockfile]' \
                '--npm[assume unprefixed package names are npm packages (default)]' \
                '--jsr[assume unprefixed package names are jsr packages]' \
                '--save-exact[Save exact version without the caret (^)]' \
                '--unscoped[Use the package name without its scope as the alias (ex. `jsr:@david/jsonc-morph` is added as `jsonc-morph`). Packages given an explicit alias are unaffected.]' \
                '--package-json[Force using package.json for dependency management instead of deno.json]' \
                '--os[Target OS for npm package installation (e.g., linux, darwin, win32)]' \
                '--arch[Target architecture for npm package installation (e.g., x64, arm64)]' \
                '--env-file[Load environment variables from local file
  Only the first environment variable with a given key is used.
  Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.
  Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.]' \
                '--check[Set type-checking behavior. This subcommand type-checks local modules by default, so passing --check is redundant; pass --check=all to also type-check remote modules. Alternatively, use the '\''deno check'\'' subcommand.]' \
                '--no-check[Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored]' \
                '--import-map[Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps]' \
                '--no-remote[Do not resolve remote modules]' \
                '--no-npm[Do not resolve npm modules]' \
                '--node-modules-dir[Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.]' \
                '--vendor[Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages]' \
                '--node-modules-linker[Sets the linker mode for npm packages (isolated or hoisted)]' \
                '--config[Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config]' \
                '--no-config[Disable automatic loading of the configuration file]' \
                '--reload[Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.]' \
                '--lock[Check the specified lock file. (If value is not provided, defaults to "./deno.lock")]' \
                '--no-lock[Disable auto discovery of the lock file]' \
                '--frozen-lockfile[Error out if lockfile is out of date]' \
                '--cert[Load certificate authority from PEM encoded file]' \
                '--unsafely-ignore-certificate-errors[DANGER: Disables verification of TLS certificates]' \
                '--min-dep-age[(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. '\''120'\'' for two hours, '\''P2D'\'' for two days, '\''2025-09-16'\'' for cutoff date, '\''2025-09-16T12:00:00+00:00'\'' for cutoff time, '\''0'\'' to disable)]' \
                '--inspect[Activate inspector on host:port [default: 127.0.0.1:9229]. Host and port are optional. Using port 0 will assign a random free port.]' \
                '--inspect-brk[Activate inspector on host:port, wait for debugger to connect and break at the start of user script]' \
                '--inspect-wait[Activate inspector on host:port and wait for debugger to connect before running user code]' \
                '--inspect-publish-uid[]' \
                '--cached-only[Require that remote dependencies are already cached]' \
                '--location[Value of globalThis.location used by some web APIs]' \
                '--v8-flags[To see a list of all available flags use --v8-flags=--help
  Flags can also be set via the DENO_V8_FLAGS environment variable.
  Any flags set with this flag are appended after the DENO_V8_FLAGS environment variable]' \
                '--seed[Set the random number generator seed]' \
                '--preload[A list of files that will be executed before the main module]' \
                '--require[A list of CommonJS modules that will be executed before the main module]' \
                '--conditions[Use this argument to specify custom conditions for npm package exports. You can also use DENO_CONDITIONS env var.

Docs: https://docs.deno.com/go/conditional-exports]' \
                '--allow-scripts[Allow running npm lifecycle scripts for the given packages
  Note: Scripts will only be executed when using a node_modules directory (`--node-modules-dir`)]' \
                '*:file:_files'
            ;;
        uninstall)
            _arguments \
                '--global[Remove globally installed packages or modules]' \
                '--root[Installation root]' \
                '--lockfile-only[Install only updating the lockfile]' \
                '--package-json[Force using package.json for dependency management instead of deno.json]' \
                '--no-check[Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored]' \
                '--import-map[Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps]' \
                '--no-remote[Do not resolve remote modules]' \
                '--no-npm[Do not resolve npm modules]' \
                '--node-modules-dir[Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.]' \
                '--vendor[Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages]' \
                '--node-modules-linker[Sets the linker mode for npm packages (isolated or hoisted)]' \
                '--config[Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config]' \
                '--no-config[Disable automatic loading of the configuration file]' \
                '--reload[Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.]' \
                '--lock[Check the specified lock file. (If value is not provided, defaults to "./deno.lock")]' \
                '--no-lock[Disable auto discovery of the lock file]' \
                '--frozen-lockfile[Error out if lockfile is out of date]' \
                '--cert[Load certificate authority from PEM encoded file]' \
                '--unsafely-ignore-certificate-errors[DANGER: Disables verification of TLS certificates]' \
                '--min-dep-age[(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. '\''120'\'' for two hours, '\''P2D'\'' for two days, '\''2025-09-16'\'' for cutoff date, '\''2025-09-16T12:00:00+00:00'\'' for cutoff time, '\''0'\'' to disable)]' \
                '*:file:_files'
            ;;
        types)
            _arguments \
                '*:file:_files'
            ;;
        completions)
            _arguments \
                '--dynamic[Generate dynamic completions for the given shell (unstable), currently this only provides available tasks for `deno task`.]' \
                '*:file:_files'
            ;;
        init)
            _arguments \
                '--lib[Generate an example library project]' \
                '--serve[Generate an example project for `deno serve`]' \
                '--npm[Generate a npm create-* project]' \
                '--jsr[Generate a project from a JSR package]' \
                '--empty[Generate a minimal project with just main.ts and deno.json]' \
                '--yes[Bypass the prompt and run with full permissions]' \
                '*:file:_files'
            ;;
        create)
            _arguments \
                '--npm[Treat unprefixed package names as npm packages]' \
                '--jsr[Treat unprefixed package names as JSR packages]' \
                '--yes[Bypass the prompt and run with full permissions]' \
                '*:file:_files'
            ;;
        jupyter)
            _arguments \
                '--install[Install a kernelspec]' \
                '--name[Set a name for the kernel (defaults to '\''deno'\''). Useful when maintaing multiple Deno kernels.]' \
                '--display[Set a display name for the kernel (defaults to '\''Deno'\''). Useful when maintaing multiple Deno kernels.]' \
                '--kernel[Start the kernel]' \
                '--conn[Path to JSON file describing connection parameters, provided by Jupyter]' \
                '--force[Force installation of a kernel, overwriting previously existing kernelspec]' \
                '*:file:_files'
            ;;
        publish)
            _arguments \
                '--token[The API token to use when publishing. If unset, interactive authentication is be used]' \
                '--dry-run[Prepare the package for publishing performing all checks and validations without uploading]' \
                '--allow-slow-types[Allow publishing with slow types]' \
                '--allow-dirty[Allow publishing if the repository has uncommitted changed]' \
                '--no-provenance[Disable provenance attestation.
  Enabled by default on Github actions, publicly links the package to where it was built and published from.]' \
                '--set-version[Set version for a package to be published.
  This flag can be used while publishing individual packages and cannot be used in a workspace.]' \
                '--check[Set type-checking behavior. This subcommand type-checks local modules by default, so passing --check is redundant; pass --check=all to also type-check remote modules. Alternatively, use the '\''deno check'\'' subcommand.]' \
                '--env-file[Load environment variables from local file
  Only the first environment variable with a given key is used.
  Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.
  Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.]' \
                '--no-check[Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored]' \
                '--import-map[Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps]' \
                '--no-remote[Do not resolve remote modules]' \
                '--no-npm[Do not resolve npm modules]' \
                '--node-modules-dir[Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.]' \
                '--vendor[Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages]' \
                '--node-modules-linker[Sets the linker mode for npm packages (isolated or hoisted)]' \
                '--config[Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config]' \
                '--no-config[Disable automatic loading of the configuration file]' \
                '--reload[Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.]' \
                '--lock[Check the specified lock file. (If value is not provided, defaults to "./deno.lock")]' \
                '--no-lock[Disable auto discovery of the lock file]' \
                '--frozen-lockfile[Error out if lockfile is out of date]' \
                '--cert[Load certificate authority from PEM encoded file]' \
                '--unsafely-ignore-certificate-errors[DANGER: Disables verification of TLS certificates]' \
                '--min-dep-age[(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. '\''120'\'' for two hours, '\''P2D'\'' for two days, '\''2025-09-16'\'' for cutoff date, '\''2025-09-16T12:00:00+00:00'\'' for cutoff time, '\''0'\'' to disable)]' \
                '*:file:_files'
            ;;
        add)
            _arguments \
                '--dev[Add the package as a dev dependency (under `devDependencies`). Note: this only applies when adding to a `package.json` file.]' \
                '--save-optional[Add the package as an optional dependency (under `optionalDependencies`). Note: this only applies when adding to a `package.json` file.]' \
                '--no-save[Install the package(s) without adding them to the configuration file.]' \
                '--save-exact[Save exact version without the caret (^)]' \
                '--unscoped[Use the package name without its scope as the alias (ex. `jsr:@david/jsonc-morph` is added as `jsonc-morph`). Packages given an explicit alias are unaffected.]' \
                '--npm[assume unprefixed package names are npm packages (default)]' \
                '--jsr[assume unprefixed package names are jsr packages]' \
                '--lockfile-only[Install only updating the lockfile]' \
                '--allow-import[Allow importing from remote hosts. Optionally specify allowed IP addresses and host names, with ports as necessary. Default value: deno.land:443,jsr.io:443,esm.sh:443,raw.esm.sh:443,cdn.jsdelivr.net:443,raw.githubusercontent.com:443,gist.githubusercontent.com:443]' \
                '--deny-import[Deny importing from remote hosts. Optionally specify denied IP addresses and host names, with ports as necessary.]' \
                '--package-json[Force using package.json for dependency management instead of deno.json]' \
                '--env-file[Load environment variables from local file
  Only the first environment variable with a given key is used.
  Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.
  Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.]' \
                '--allow-scripts[Allow running npm lifecycle scripts for the given packages
  Note: Scripts will only be executed when using a node_modules directory (`--node-modules-dir`)]' \
                '--no-check[Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored]' \
                '--import-map[Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps]' \
                '--no-remote[Do not resolve remote modules]' \
                '--no-npm[Do not resolve npm modules]' \
                '--node-modules-dir[Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.]' \
                '--vendor[Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages]' \
                '--node-modules-linker[Sets the linker mode for npm packages (isolated or hoisted)]' \
                '--config[Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config]' \
                '--no-config[Disable automatic loading of the configuration file]' \
                '--reload[Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.]' \
                '--lock[Check the specified lock file. (If value is not provided, defaults to "./deno.lock")]' \
                '--no-lock[Disable auto discovery of the lock file]' \
                '--frozen-lockfile[Error out if lockfile is out of date]' \
                '--cert[Load certificate authority from PEM encoded file]' \
                '--unsafely-ignore-certificate-errors[DANGER: Disables verification of TLS certificates]' \
                '--min-dep-age[(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. '\''120'\'' for two hours, '\''P2D'\'' for two days, '\''2025-09-16'\'' for cutoff date, '\''2025-09-16T12:00:00+00:00'\'' for cutoff time, '\''0'\'' to disable)]' \
                '*:file:_files'
            ;;
        remove)
            _arguments \
                '--global[Remove globally installed package or module]' \
                '--root[Installation root]' \
                '--lockfile-only[Install only updating the lockfile]' \
                '--package-json[Force using package.json for dependency management instead of deno.json]' \
                '--no-check[Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored]' \
                '--import-map[Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps]' \
                '--no-remote[Do not resolve remote modules]' \
                '--no-npm[Do not resolve npm modules]' \
                '--node-modules-dir[Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.]' \
                '--vendor[Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages]' \
                '--node-modules-linker[Sets the linker mode for npm packages (isolated or hoisted)]' \
                '--config[Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config]' \
                '--no-config[Disable automatic loading of the configuration file]' \
                '--reload[Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.]' \
                '--lock[Check the specified lock file. (If value is not provided, defaults to "./deno.lock")]' \
                '--no-lock[Disable auto discovery of the lock file]' \
                '--frozen-lockfile[Error out if lockfile is out of date]' \
                '--cert[Load certificate authority from PEM encoded file]' \
                '--unsafely-ignore-certificate-errors[DANGER: Disables verification of TLS certificates]' \
                '--min-dep-age[(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. '\''120'\'' for two hours, '\''P2D'\'' for two days, '\''2025-09-16'\'' for cutoff date, '\''2025-09-16T12:00:00+00:00'\'' for cutoff time, '\''0'\'' to disable)]' \
                '*:file:_files'
            ;;
        outdated)
            _arguments \
                '--recursive[Include all workspace members]' \
                '--compatible[Only consider versions that satisfy semver requirements]' \
                '--update[Update dependency versions]' \
                '--latest[Consider the latest version, regardless of semver constraints]' \
                '--interactive[Interactively select which dependencies to update]' \
                '--lockfile-only[Install only updating the lockfile]' \
                '--env-file[Load environment variables from local file
  Only the first environment variable with a given key is used.
  Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.
  Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.]' \
                '--no-check[Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored]' \
                '--import-map[Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps]' \
                '--no-remote[Do not resolve remote modules]' \
                '--no-npm[Do not resolve npm modules]' \
                '--node-modules-dir[Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.]' \
                '--vendor[Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages]' \
                '--node-modules-linker[Sets the linker mode for npm packages (isolated or hoisted)]' \
                '--config[Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config]' \
                '--no-config[Disable automatic loading of the configuration file]' \
                '--reload[Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.]' \
                '--lock[Check the specified lock file. (If value is not provided, defaults to "./deno.lock")]' \
                '--no-lock[Disable auto discovery of the lock file]' \
                '--frozen-lockfile[Error out if lockfile is out of date]' \
                '--cert[Load certificate authority from PEM encoded file]' \
                '--unsafely-ignore-certificate-errors[DANGER: Disables verification of TLS certificates]' \
                '--min-dep-age[(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. '\''120'\'' for two hours, '\''P2D'\'' for two days, '\''2025-09-16'\'' for cutoff date, '\''2025-09-16T12:00:00+00:00'\'' for cutoff time, '\''0'\'' to disable)]' \
                '*:file:_files'
            ;;
        update)
            _arguments \
                '--recursive[Include all workspace members]' \
                '--latest[Consider the latest version, regardless of semver constraints]' \
                '--compatible[Only consider versions that satisfy semver requirements]' \
                '--lockfile-only[Install only updating the lockfile]' \
                '--interactive[Interactively select which dependencies to update]' \
                '--env-file[Load environment variables from local file
  Only the first environment variable with a given key is used.
  Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.
  Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.]' \
                '--no-check[Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored]' \
                '--import-map[Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps]' \
                '--no-remote[Do not resolve remote modules]' \
                '--no-npm[Do not resolve npm modules]' \
                '--node-modules-dir[Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.]' \
                '--vendor[Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages]' \
                '--node-modules-linker[Sets the linker mode for npm packages (isolated or hoisted)]' \
                '--config[Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config]' \
                '--no-config[Disable automatic loading of the configuration file]' \
                '--reload[Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.]' \
                '--lock[Check the specified lock file. (If value is not provided, defaults to "./deno.lock")]' \
                '--no-lock[Disable auto discovery of the lock file]' \
                '--frozen-lockfile[Error out if lockfile is out of date]' \
                '--cert[Load certificate authority from PEM encoded file]' \
                '--unsafely-ignore-certificate-errors[DANGER: Disables verification of TLS certificates]' \
                '--min-dep-age[(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. '\''120'\'' for two hours, '\''P2D'\'' for two days, '\''2025-09-16'\'' for cutoff date, '\''2025-09-16T12:00:00+00:00'\'' for cutoff time, '\''0'\'' to disable)]' \
                '*:file:_files'
            ;;
        deploy)
            _arguments \
                '*:file:_files'
            ;;
        sandbox)
            _arguments \
                '*:file:_files'
            ;;
        clean)
            _arguments \
                '--except[Retain cache data needed by the given files]' \
                '--dry-run[Show what would be removed without performing any actions]' \
                '--node-modules-dir[Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.]' \
                '--vendor[Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages]' \
                '--node-modules-linker[Sets the linker mode for npm packages (isolated or hoisted)]' \
                '*:file:_files'
            ;;
        list)
            _arguments \
                '--depth[Maximum depth of the dependency tree to display (0 = direct dependencies only)]' \
                '--prod[Only list production dependencies]' \
                '--dev[Only list development dependencies]' \
                '--recursive[Include all workspace members]' \
                '*:file:_files'
            ;;
        link)
            _arguments \
                '--lockfile-only[Install only updating the lockfile]' \
                '--lock[Check the specified lock file. (If value is not provided, defaults to "./deno.lock")]' \
                '--no-lock[Disable auto discovery of the lock file]' \
                '--frozen-lockfile[Error out if lockfile is out of date]' \
                '*:file:_files'
            ;;
        unlink)
            _arguments \
                '--lockfile-only[Install only updating the lockfile]' \
                '--lock[Check the specified lock file. (If value is not provided, defaults to "./deno.lock")]' \
                '--no-lock[Disable auto discovery of the lock file]' \
                '--frozen-lockfile[Error out if lockfile is out of date]' \
                '*:file:_files'
            ;;
        approve-scripts)
            _arguments \
                '--lockfile-only[Install only updating the lockfile]' \
                '--no-check[Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored]' \
                '--import-map[Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps]' \
                '--no-remote[Do not resolve remote modules]' \
                '--no-npm[Do not resolve npm modules]' \
                '--node-modules-dir[Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.]' \
                '--vendor[Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages]' \
                '--node-modules-linker[Sets the linker mode for npm packages (isolated or hoisted)]' \
                '--config[Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config]' \
                '--no-config[Disable automatic loading of the configuration file]' \
                '--reload[Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.]' \
                '--lock[Check the specified lock file. (If value is not provided, defaults to "./deno.lock")]' \
                '--no-lock[Disable auto discovery of the lock file]' \
                '--frozen-lockfile[Error out if lockfile is out of date]' \
                '--cert[Load certificate authority from PEM encoded file]' \
                '--unsafely-ignore-certificate-errors[DANGER: Disables verification of TLS certificates]' \
                '--min-dep-age[(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. '\''120'\'' for two hours, '\''P2D'\'' for two days, '\''2025-09-16'\'' for cutoff date, '\''2025-09-16T12:00:00+00:00'\'' for cutoff time, '\''0'\'' to disable)]' \
                '*:file:_files'
            ;;
        lsp)
            _arguments \
                '*:file:_files'
            ;;
        vendor)
            _arguments \
                '--help[[possible values: unstable, full]]' \
                '--quiet[Suppress diagnostic output]' \
                '--unstable[The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead
  To view the list of individual unstable feature flags, run this command again with --help=unstable]' \
                '*:file:_files'
            ;;
        bundle)
            _arguments \
                '--output[Output path`]' \
                '--outdir[Output directory for bundled files]' \
                '--format[]' \
                '--packages[How to handle packages. Accepted values are '\''bundle'\'' or '\''external'\'']' \
                '--platform[Platform to bundle for. Accepted values are '\''browser'\'' or '\''deno'\'']' \
                '--sourcemap[Generate source map. Accepted values are '\''linked'\'', '\''inline'\'', or '\''external'\'']' \
                '--external[]' \
                '--watch[Watch and rebuild on changes]' \
                '--minify[Minify the output]' \
                '--keep-names[Keep function and class names]' \
                '--code-splitting[Enable code splitting]' \
                '--inline-imports[Whether to inline imported modules into the importing file [default: true]]' \
                '--declaration[Generate .d.ts declaration files alongside the bundle]' \
                '--check[Enable type-checking. This subcommand does not type-check by default; pass --check=all to also type-check remote modules. Alternatively, use the '\''deno check'\'' subcommand.]' \
                '--no-check[Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored]' \
                '--import-map[Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps]' \
                '--no-remote[Do not resolve remote modules]' \
                '--no-npm[Do not resolve npm modules]' \
                '--node-modules-dir[Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.]' \
                '--vendor[Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages]' \
                '--node-modules-linker[Sets the linker mode for npm packages (isolated or hoisted)]' \
                '--config[Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config]' \
                '--no-config[Disable automatic loading of the configuration file]' \
                '--reload[Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.]' \
                '--lock[Check the specified lock file. (If value is not provided, defaults to "./deno.lock")]' \
                '--no-lock[Disable auto discovery of the lock file]' \
                '--frozen-lockfile[Error out if lockfile is out of date]' \
                '--cert[Load certificate authority from PEM encoded file]' \
                '--unsafely-ignore-certificate-errors[DANGER: Disables verification of TLS certificates]' \
                '--min-dep-age[(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. '\''120'\'' for two hours, '\''P2D'\'' for two days, '\''2025-09-16'\'' for cutoff date, '\''2025-09-16T12:00:00+00:00'\'' for cutoff time, '\''0'\'' to disable)]' \
                '--allow-import[Allow importing from remote hosts. Optionally specify allowed IP addresses and host names, with ports as necessary. Default value: deno.land:443,jsr.io:443,esm.sh:443,raw.esm.sh:443,cdn.jsdelivr.net:443,raw.githubusercontent.com:443,gist.githubusercontent.com:443]' \
                '--deny-import[Deny importing from remote hosts. Optionally specify denied IP addresses and host names, with ports as necessary.]' \
                '--allow-scripts[Allow running npm lifecycle scripts for the given packages
  Note: Scripts will only be executed when using a node_modules directory (`--node-modules-dir`)]' \
                '*:file:_files'
            ;;
        audit)
            _arguments \
                '--level[Only show advisories with severity greater or equal to the one specified]' \
                '--ignore-unfixable[Ignore advisories that don'\''t have any actions to resolve them]' \
                '--ignore-registry-errors[Return exit code 0 if remote service(s) responds with an error.]' \
                '--socket[Check against socket.dev vulnerability database]' \
                '--fix[Automatically fix vulnerabilities by upgrading packages]' \
                '--ignore[Ignore advisories matching the given CVE IDs]' \
                '--lock[Check the specified lock file. (If value is not provided, defaults to "./deno.lock")]' \
                '--no-lock[Disable auto discovery of the lock file]' \
                '--frozen-lockfile[Error out if lockfile is out of date]' \
                '*:file:_files'
            ;;
        why)
            _arguments \
                '--env-file[Load environment variables from local file
  Only the first environment variable with a given key is used.
  Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.
  Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.]' \
                '--lock[Check the specified lock file. (If value is not provided, defaults to "./deno.lock")]' \
                '--no-lock[Disable auto discovery of the lock file]' \
                '--frozen-lockfile[Error out if lockfile is out of date]' \
                '*:file:_files'
            ;;
        transpile)
            _arguments \
                '--output[Output file path (for single file transpilation)]' \
                '--outdir[Output directory for transpiled files]' \
                '--source-map[Source map mode: none, inline, or separate]' \
                '--declaration[Generate .d.ts declaration files (requires type-checking via tsc)]' \
                '--no-check[Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored]' \
                '--import-map[Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps]' \
                '--no-remote[Do not resolve remote modules]' \
                '--no-npm[Do not resolve npm modules]' \
                '--node-modules-dir[Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.]' \
                '--vendor[Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages]' \
                '--node-modules-linker[Sets the linker mode for npm packages (isolated or hoisted)]' \
                '--config[Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config]' \
                '--no-config[Disable automatic loading of the configuration file]' \
                '--reload[Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.]' \
                '--lock[Check the specified lock file. (If value is not provided, defaults to "./deno.lock")]' \
                '--no-lock[Disable auto discovery of the lock file]' \
                '--frozen-lockfile[Error out if lockfile is out of date]' \
                '--cert[Load certificate authority from PEM encoded file]' \
                '--unsafely-ignore-certificate-errors[DANGER: Disables verification of TLS certificates]' \
                '--min-dep-age[(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. '\''120'\'' for two hours, '\''P2D'\'' for two days, '\''2025-09-16'\'' for cutoff date, '\''2025-09-16T12:00:00+00:00'\'' for cutoff time, '\''0'\'' to disable)]' \
                '*:file:_files'
            ;;
        bump-version)
            _arguments \
                '--workspace[Bump every package in the workspace (auto-detected at the workspace root)]' \
                '--no-workspace[Disable workspace mode and only bump the deno.json/package.json in the current directory]' \
                '--dry-run[Print the planned changes without writing any files]' \
                '--start[[conventional-commits mode] Git ref to start from. Default: latest tag (git describe --tags --abbrev=0)]' \
                '--base[[conventional-commits mode] Git ref to compare against. Default: current branch]' \
                '--import-map[Path to the import map to rewrite jsr: version constraints in. Defaults to the root deno.json (or its importMap target)]' \
                '--release-notes[[conventional-commits mode] Path to the release notes file to prepend. Default: Releases.md]' \
                '--config[Explicit path to the manifest file to bump.
  May point to a `deno.json`/`deno.jsonc` or a `package.json`. When
  set, single-file mode is forced (workspace auto-detection is bypassed).
  Useful when both `deno.json` and `package.json` exist in the same
  directory.]' \
                '*:file:_files'
            ;;
        ci)
            _arguments \
                '--prod[Only install production dependencies (excludes devDependencies)]' \
                '--skip-types[Exclude @types/* packages from installation.
Be careful, as it uses a name-based heuristic and may skip packages that ship runtime code.]' \
                '--env-file[Load environment variables from local file
  Only the first environment variable with a given key is used.
  Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.
  Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.]' \
                '*:file:_files'
            ;;
        desktop)
            _arguments \
                '--check[Set type-checking behavior. This subcommand type-checks local modules by default, so passing --check is redundant; pass --check=all to also type-check remote modules. Alternatively, use the '\''deno check'\'' subcommand.]' \
                '--inspect-renderer[Override the CEF renderer debugger listen address; defaults to an auto-allocated port]' \
                '--include[Includes an additional module or file/directory in the compiled executable.
  Use this flag if a dynamically imported module or a web worker main module
  fails to load in the executable or to embed a file or directory in the executable.
  This flag can be passed multiple times, to include multiple additional modules.]' \
                '--exclude[Excludes a file/directory in the compiled executable.
  Use this flag to exclude a specific file or directory within the included files.]' \
                '--exclude-unused-npm[Embed only the npm packages reachable from the module graph (managed npm; no node_modules directory).
  Without this flag the full managed npm snapshot from the lockfile / package.json is embedded.
  Reduces binary size when the lockfile contains packages the entrypoint does not import.
  Skips packages that are only reached through non-statically-analyzable dynamic imports;
  pass those with --include npm:<pkg> if needed.]' \
                '--output[Output path (e.g. MyApp.app, MyApp.dmg, MyApp.AppImage, MyApp.deb, MyApp.rpm, MyApp.msi)]' \
                '--target[Target OS architecture]' \
                '--no-code-cache[Disable V8 code cache feature]' \
                '--icon[Set the application icon (.ico on Windows, .icns or .png on macOS)]' \
                '--hmr[Run the desktop app with Hot Module Replacement enabled]' \
                '--backend[Backend to use for the desktop app]' \
                '--engine[JS engine the desktop binary runs on (quickjs is smaller and experimental, and does not receive the same security updates as v8)]' \
                '--all-targets[Build for all supported target platforms]' \
                '--compress[Make the packaged app self-extracting: the payload is compressed inside the app and unpacked on first launch. Off by default. Defaults to xz (decompressed by the system `tar` everywhere); zstd is smaller/faster but needs the `zstd` tool at runtime.]' \
                '--ext[Set content type of the supplied file]' \
                '--env-file[Load environment variables from local file
  Only the first environment variable with a given key is used.
  Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.
  Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.]' \
                '--no-check[Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored]' \
                '--import-map[Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps]' \
                '--no-remote[Do not resolve remote modules]' \
                '--no-npm[Do not resolve npm modules]' \
                '--node-modules-dir[Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.]' \
                '--vendor[Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages]' \
                '--node-modules-linker[Sets the linker mode for npm packages (isolated or hoisted)]' \
                '--config[Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config]' \
                '--no-config[Disable automatic loading of the configuration file]' \
                '--reload[Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.]' \
                '--lock[Check the specified lock file. (If value is not provided, defaults to "./deno.lock")]' \
                '--no-lock[Disable auto discovery of the lock file]' \
                '--frozen-lockfile[Error out if lockfile is out of date]' \
                '--cert[Load certificate authority from PEM encoded file]' \
                '--unsafely-ignore-certificate-errors[DANGER: Disables verification of TLS certificates]' \
                '--min-dep-age[(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. '\''120'\'' for two hours, '\''P2D'\'' for two days, '\''2025-09-16'\'' for cutoff date, '\''2025-09-16T12:00:00+00:00'\'' for cutoff time, '\''0'\'' to disable)]' \
                '--inspect[Activate inspector on host:port [default: 127.0.0.1:9229]. Host and port are optional. Using port 0 will assign a random free port.]' \
                '--inspect-brk[Activate inspector on host:port, wait for debugger to connect and break at the start of user script]' \
                '--inspect-wait[Activate inspector on host:port and wait for debugger to connect before running user code]' \
                '--inspect-publish-uid[]' \
                '--cached-only[Require that remote dependencies are already cached]' \
                '--location[Value of globalThis.location used by some web APIs]' \
                '--v8-flags[To see a list of all available flags use --v8-flags=--help
  Flags can also be set via the DENO_V8_FLAGS environment variable.
  Any flags set with this flag are appended after the DENO_V8_FLAGS environment variable]' \
                '--seed[Set the random number generator seed]' \
                '--preload[A list of files that will be executed before the main module]' \
                '--require[A list of CommonJS modules that will be executed before the main module]' \
                '--conditions[Use this argument to specify custom conditions for npm package exports. You can also use DENO_CONDITIONS env var.

Docs: https://docs.deno.com/go/conditional-exports]' \
                '--allow-scripts[Allow running npm lifecycle scripts for the given packages
  Note: Scripts will only be executed when using a node_modules directory (`--node-modules-dir`)]' \
                '*:file:_files'
            ;;
        pack)
            _arguments \
                '--output[Output file path (defaults to <name>-<version>.tgz)]' \
                '--dry-run[Show what would be packed without creating the tarball]' \
                '--allow-slow-types[Skip fast-check type extraction; .d.ts files are omitted from the output]' \
                '--allow-dirty[Allow packing if the repository has uncommitted changes]' \
                '--set-version[Override the version in the tarball]' \
                '--no-source-maps[Don'\''t include source maps in the output]' \
                '--ignore[Ignore files matching these patterns]' \
                '--config[Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config]' \
                '--no-config[Disable automatic loading of the configuration file]' \
                '--env-file[Load environment variables from local file
  Only the first environment variable with a given key is used.
  Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.
  Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.]' \
                '*:file:_files'
            ;;
        x)
            _arguments \
                '--yes[Assume confirmation for all prompts]' \
                '--package[Package to install (use when the binary name differs from the package name)]' \
                '--ignore-scripts[Do not run npm lifecycle scripts for the given packages]' \
                '--install-alias[Creates a dx alias so you can run dx <command> instead of deno x <command>]' \
                '--check[Enable type-checking. This subcommand does not type-check by default; pass --check=all to also type-check remote modules. Alternatively, use the '\''deno check'\'' subcommand.]' \
                '--env-file[Load environment variables from local file
  Only the first environment variable with a given key is used.
  Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.
  Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.]' \
                '--allow-scripts[Allow running npm lifecycle scripts for the given packages
  Note: Scripts will only be executed when using a node_modules directory (`--node-modules-dir`)]' \
                '--no-check[Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored]' \
                '--import-map[Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps]' \
                '--no-remote[Do not resolve remote modules]' \
                '--no-npm[Do not resolve npm modules]' \
                '--node-modules-dir[Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.]' \
                '--vendor[Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages]' \
                '--node-modules-linker[Sets the linker mode for npm packages (isolated or hoisted)]' \
                '--config[Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config]' \
                '--no-config[Disable automatic loading of the configuration file]' \
                '--reload[Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.]' \
                '--lock[Check the specified lock file. (If value is not provided, defaults to "./deno.lock")]' \
                '--no-lock[Disable auto discovery of the lock file]' \
                '--frozen-lockfile[Error out if lockfile is out of date]' \
                '--cert[Load certificate authority from PEM encoded file]' \
                '--unsafely-ignore-certificate-errors[DANGER: Disables verification of TLS certificates]' \
                '--min-dep-age[(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. '\''120'\'' for two hours, '\''P2D'\'' for two days, '\''2025-09-16'\'' for cutoff date, '\''2025-09-16T12:00:00+00:00'\'' for cutoff time, '\''0'\'' to disable)]' \
                '--cached-only[Require that remote dependencies are already cached]' \
                '--location[Value of globalThis.location used by some web APIs]' \
                '--v8-flags[To see a list of all available flags use --v8-flags=--help
  Flags can also be set via the DENO_V8_FLAGS environment variable.
  Any flags set with this flag are appended after the DENO_V8_FLAGS environment variable]' \
                '--seed[Set the random number generator seed]' \
                '--preload[A list of files that will be executed before the main module]' \
                '--require[A list of CommonJS modules that will be executed before the main module]' \
                '--conditions[Use this argument to specify custom conditions for npm package exports. You can also use DENO_CONDITIONS env var.

Docs: https://docs.deno.com/go/conditional-exports]' \
                '--inspect[Activate inspector on host:port [default: 127.0.0.1:9229]. Host and port are optional. Using port 0 will assign a random free port.]' \
                '--inspect-brk[Activate inspector on host:port, wait for debugger to connect and break at the start of user script]' \
                '--inspect-wait[Activate inspector on host:port and wait for debugger to connect before running user code]' \
                '--inspect-publish-uid[]' \
                '*:file:_files'
            ;;
        json_reference)
            _arguments \
                '*:file:_files'
            ;;
        esac
    ;;
    esac
}

# Register the completion function (needed when sourcing after compinit)
compdef _deno deno
