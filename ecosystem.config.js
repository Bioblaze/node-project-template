module.exports = {
  apps : [
    {
      name: "app",
      script: './src/index.js',
      watch: ["./src/"],
      env: {
        NODE_ENV: "development",
      },
      env_production: {
        NODE_ENV: "production",
      },
      env_staging: {
        NODE_ENV: "staging",
      },
      env_development: {
        NODE_ENV: "development",
      },
      error_file: "./errors.log",
      out_file: "./console.log"
    }
  ],
  deploy : {
    production : {
      user : 'account',
      host : '127.0.0.1',
      ref  : 'origin/master',
      repo : 'git@github.com:repo.git',
      path : '/home/account/app',
      ssh_options: ["StrictHostKeyChecking=no", "PasswordAuthentication=no"],
      key: "./deploy_key",
      "pre-setup": "",
      "post-setup": "",
      'pre-deploy-local': '',
      'post-deploy': 'npm install && pm2 startOrRestart ecosystem.config.js --env production'
    },
    staging : {
      user : 'account',
      host : '127.0.0.1',
      ref  : 'origin/staging',
      repo : 'git@github.com:repo.git',
      path : '/home/account/app',
      ssh_options: ["StrictHostKeyChecking=no", "PasswordAuthentication=no"],
      key: "./deploy_key",
      "pre-setup": "",
      "post-setup": "",
      'pre-deploy-local': '',
      'post-deploy': 'npm install && pm2 startOrRestart ecosystem.config.js --env staging'
    },
    development : {
      user : 'account',
      host : '127.0.0.1',
      ref  : 'origin/staging',
      repo : 'git@github.com:repo.git',
      path : '/home/account/app',
      ssh_options: ["StrictHostKeyChecking=no", "PasswordAuthentication=no"],
      key: "./deploy_key",
      "pre-setup": "",
      "post-setup": "",
      'pre-deploy-local': '',
      'post-deploy': 'npm install && pm2 startOrRestart ecosystem.config.js --env development'
    }
  }
};
