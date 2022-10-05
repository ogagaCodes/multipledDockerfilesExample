module.exports = {
    apps: [
      /**
       * **************************************************
       * ********************** APIS **********************
       * **************************************************
       */
      {
        name: 'YOU-API',
        script: 'you.js',
        cwd: '.',
        instances: 1,
        autorestart: true,
        watch: false,
        max_memory_restart: '1G',
      },
      {
        name: 'ME-API',
        script: 'me.js',
        cwd: '.',
        instances: 1,
        autorestart: true,
        watch: false,
        max_memory_restart: '1G',
      },
    ],
  };