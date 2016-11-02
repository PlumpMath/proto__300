# WebApps


The webapps are associated with distinct websockets(&HTTP/S) endpoints (same address, different ports) to the same NodeJS process.

`proto`, (synonym) `proto-user`  -- generic main user app --


`brujo`, (synonym) `brujo-terminal` -- developers, sys-admins, terminal into system data with graphics display.




#### Brujo--Terminal raison d'etre / explained:

As a full-stack developer, when working on a full-stack system, there are two main sources of data, the server's terminal console output and the browser terminal console output.  This is not the most optimal situational-awareness provision, and we can do much better by havi# WebApps


The webapps are associated with distinct websockets(&HTTP/S) endpoints (same address, different ports) to the same NodeJS process.

`proto`, (synonym) `proto-user`  -- generic main user app --


`brujo`, (synonym) `brujo-terminal` -- developers, sys-admins, terminal into system data with graphics display.



#### Proto

The proto-typal user, the application as required for implementation of particular specifications.

- Websockets should be processed in WebWorkers, and keep the traffic below certain frequency thresholds (batch chunks)
- Configure Webpack for language pack loading assets on demand stuff.
- SVG-pretty-much-all-the-things approach; this pattern is maturing nicely.



#### Brujo--Terminal raison d'etre / explained:

- Developers' super-terminal
- Sys-admins' radar-scope
- Market-analyst/usage-analyst tool
- Marketing analysis tasks / user-behaviour analysis interface for human operators

As a full-stack developer, when working on a full-stack system, there are two main sources of data, the server's terminal console output and the browser terminal console output.  This is not the most optimal situational-awareness provision, and we can do much better by having a full 2-d or 3-d computer symbolic graphical output on the WebApp's (could also be implemented as an Electron desktop native app) browser display with SVG, or later if really crazy sophisicated with WebGL components.

Where it gets interesting is how to transmit critical data to `brujo`. For example, in the critical server-side development role we could have the configuration of the system on a particular execution iteration to be a function of environment variables that are set from the `brujo-terminal` and maintained not in program state but in a Redis cache, which survives iterations.  This means that we can meta-program with Nodejs, Redis, and interact with the process in a richer way (both controlling and surveying) than before.  In the same vein, we can make a new log function to replace `console.log` which logs syncronously to a redis data-structure representation of output, even errors.  So we can get better management of debugging output through `brujo` than through the terminal console.

For example I typically use the alias function `c` ( where `c = console.log.bind console`), to log variable state to console to get a sense of how the program is running.  Reading the console is suboptimal compared to if a range of relevant data were pipelined into a well-designed graphical interface.  We can syncronously log in a structured way onto a Redis data structure that will survive the process, so when `nodemon` does a restart one of the first tasks will be to pick up & parse wrap prepare that log package and send it to the web-client for display. In other words, we have a tool to dramatically increase our insight into the system in realtime, and time-tracked (rewind, fastforward).

In the QA and live system context, `brujo` can take on other tasks, offering sys-admins and analysts real-time insight into program status and user-interaction status.

_more later on this stuff..._
ng a full 2-d or 3-d computer symbolic graphical output on the WebApp's (could also be implemented as an Electron desktop native app) browser display with SVG, or later if really crazy sophisicated with WebGL components.

Where it gets interesting is how to transmit critical data to `brujo`. For example, in the critical server-side development role we could have the configuration of the system on a particular execution iteration to be a function of environment variables that are set from the `brujo-terminal` and maintained not in program state but in a Redis cache, which survives iterations.  This means that we can meta-program with Nodejs, Redis, and interact with the process in a richer way (both controlling and surveying) than before.  In the same vein, we can make a new log function to replace `console.log` which logs syncronously to a redis data-structure representation of output, even errors.  So we can get better management of debugging output through `brujo` than through the terminal console.

In the QA and live system context, `brujo` can take on other tasks, offering sys-admins and analysts real-time insight into program status and user-interaction status.
