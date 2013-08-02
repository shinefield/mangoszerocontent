mangos-zero-database ![Project status](http://getmangos.com/assets/img/repository-status-maintained.png)
====================
A content database for [mangos-zero][10], and *World of Warcraft Client Patch
1.12* - [_Drums of War_][50]. It is compatible with client 1.12.1 (build 5875),
and 1.12.2 (build 6005).

License
-------
**mangos-zero-database** is released for free under the terms of the
Creative Commons Attribution-NonCommercial-ShareAlike license. The file
`LICENSE.md` **must** be a part of any redistributable packages made from
this software.  No licenses should be removed from this software if you are
making redistributable copies.


Getting started
---------------
The basic principle behind this customized database repository is to keep the
databases stored as individual tables, and all content rows stored as single
lines to make changes more trackable for the user (that would be you).

The repository is developed and maintained using the excellent [git-flow][110]
extension for git, to provide a clear, and visible [workflow][111] to the user.


How this works
--------------
The repository has been split into folders for each of the [mangos-zero][1]
databases. Each folder contains dumps for the structure of the database,
without any content.

The `mysql_import.sh` script will initially load the database structure, and
then load any update supplied in the `_updates` folder. Updates are kept small
so that each update can be considered atomic since it will add a single feature
or data unit, which fully works without any other updates. This allows us to
gradually research, verify, and add the games' content to our database.

Once the import script is done, it will execute a optimization query, which
tries to order every database table in a readable fashion.

Further documentation of this project can be found on the [project wiki][3].
It covers both definitions of how we build and maintain this project, and
also covers the format and meaning of each database table.

For those who have not yet encountered the [mangos-zero database][12], we
have added tutorials for common activities you might be interested in.

If anything is missing, submit an issue, and we will add it.

Compatibility
-------------
The *mangos-zero* database is compatible with [mangos-zero][10].  It also
requires [scripts][11] in order to be fully enjoyable.


Installation
------------
By default **mangos-zero** uses four databases:

* `zp_characters`: where all character data is stored,
* `zp_realm`: where user accounts, and realms are defined,
* `zp_world`: where the world with creatures, items, objects, quests, etc. is defined,
* `zp_scripts`: and the ScriptDevZero database.

In order to use this database repository, you will have to edit `mysql_info`,
and edit in the desired username, hostname, and password.

Once you have the desired database user and rights configured in MySQL, you may
use the `mysql_import` script to load the individual data tables into your
databases.  Should your database user have wildcard rights, the script creates
the database - if not existent - and then populates them.

If you make changes to the database, either by adding/modifying content, or by
making changes to the database structure, you may execute `mysql_dump` to save
each table into the repository.  Should you add or remove tables, add `dump_data`,
`dump_struc` commands to `mysql_dump`, or remove them as needed.


Configuring you realm list
--------------------------
Connect to your MySQL server and execute the following command:

    UPDATE
        `zp_realm`.`realmlist`
    SET
        `address` = '192.168.2.101'
    WHERE
        `realmlist`.`id` = 1;

Please replace `192.168.2.101` with your local IP address!


Development
-----------
The **develop** branch is where the development of *mangos-zero database* is
done. Any of the commits submitted here may or may not become part of the next
release.

It is recommended to use the **master** branch for stable systems, and only use
the **develop** branch if you intend to test commits and submit issues and/or
reports.


And if something goes wrong?
----------------------------
_If_ you feel like submitting an issue, please do so *only* if you are willing
to provide a detailed report, and are available to verify any solution to the
issue provided by the developers of this repository.


[1]: https://github.com/mangoszero "mangos-zero"
[2]: https://bitbucket.org/danielsreichenbach/mangos-zero-database/ "clean mangos-zero database"
[3]: https://bitbucket.org/danielsreichenbach/mangos-zero-database/wiki "documentation wiki"

[10]: https://github.com/mangoszero/server "mangos zero"
[11]: https://github.com/mangoszero/scripts "script bindings"
[12]: https://github.com/mangoszero/database "content database"

[50]: http://eu.blizzard.com/en-gb/games/wow/ "World of Warcraft"
[51]: http://www.wowpedia.org/Patch_1.12.0 "WoW 1.12.0 - Drums of War"

[101]: http://github.com/ "github - social coding"

[110]: http://nvie.com/posts/a-successful-git-branching-model/ "git flow extension"
[111]: http://yakiloo.com/getting-started-git-flow/ "git flow workflow"
