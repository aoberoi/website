spawn = require('child_process').spawn
path = require('path')

rootDir = path.join(__dirname, '..', '..')

module.exports = setupDeploy = (options, next) ->
  team = options.team
  console.log team.slug, 'running deploy setup'

  setup = spawn path.join(__dirname, './setup-deploy.sh'),
    [team.ip],
    cwd: path.join(rootDir, 'repos', team.slug)
    stdio: 'inherit'
  setup.on 'error', (err) -> next(err)
  setup.on 'exit', (err) -> next(err)
