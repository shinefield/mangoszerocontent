mangos-zero game content
========================
Game content for [mangos-zero][10], and *World of Warcraft Client Patch 1.12*
- [_Drums of War_][50]. It is compatible with client 1.12.1 (build 5875),
and 1.12.2 (build 6005).

## License

**mangos-zero game content** is released for free under the terms of the
Creative Commons Attribution-NonCommercial-ShareAlike license. The file
`LICENSE.md` **must** be a part of any redistributable packages made from
this software.  No licenses should be removed from this software if you are
making redistributable copies.

## Getting started

The game content repository contains both the required databases and Lua
scripts for the [Eluna][eluna] Lua engine.

The `database` directory contains dumps of the current database structure,
and gradual update scripts that will import game content in enGB and also
localized game content - currently for deDE - into the databases.

The `scripts` directory contains all the Lua scripts needed to enjoy the
game completely. Please not that without these scripts, most events and
creatures will simply do nothing.

Further documentation of this project can be found on the [documentation][3].
It covers both definitions of how we build and maintain this project, and
also covers the format and meaning of each database table.

For those who have not yet encountered the [mangos-zero database][2], we
have added tutorials for common activities you might be interested in.

If anything is missing, submit an issue, and we will add it.

## Compatibility

The *mangos-zero* database is compatible with [mangos-zero][10].  It also
requires [scripts][11] in order to be fully enjoyable.

## Installation

By default **mangos-zero** uses four databases:

* `character`: where all character data is stored,
* `realm`: where user accounts, and realms are defined,
* `world`: where the world with creatures, items, objects, quests, etc. is defined,
* `script`: and the ScriptDev2 database.

In order to use this database repository, you will have to edit `settings`,
and edit in the desired user name, host name, and password.

Once you have the desired database user and rights configured in MySQL, you may
use the `import` script to load the individual data tables into your
databases.  Should your database user have wild-card rights, the script creates
the database - if not existent - and then populates them.

## Configuring you realm list

Connect to your MySQL server and execute the following command on the realm
list database:

    UPDATE
        `realmlist`
    SET
        `address` = '192.168.2.101'
    WHERE
        `realmlist`.`id` = 1;

Please replace `192.168.2.101` with your local/public IP address, and make
sure that you configured the same IP address in your mangos configuration!

## Development

The basic principle behind this customized database repository is to keep the
databases stored as individual tables, and all content rows stored as single
lines to make changes more trackable for the user (that would be you).

The repository is developed and maintained using the excellent [git-flow][110]
extension for git, to provide a clear, and visible [workflow][111] to the user.

The **develop** branch is where the development of *mangos-zero database* is
done. Any of the commits submitted here may or may not become part of the next
release.

It is recommended to use the **master** branch for stable systems, and only use
the **develop** branch if you intend to test commits and submit issues and/or
reports.

**Note**: you can also make use of tagged release versions, which in general
are considered stable.


[1]:        http://bitbucket.org/mangoszero "mangos-zero"
[2]:        http://bitbucket.org/mangoszero/content/ "mangos-zero game content database"
[3]:        http://docs.getmangos.com/ "mangos-zero documentation"

[10]:       http://bitbucket.org/mangoszero/server "mangos-zero · server"
[11]:       http://bitbucket.org/mangoszero/scripts "mangos-zero · script extensions"

[50]:       http://blizzard.com/games/wow/ "World of Warcraft"
[51]:       http://www.wowpedia.org/Patch_1.12.0 "WoW 1.12.0 - Drums of War"

[110]:      http://nvie.com/posts/a-successful-git-branching-model/ "git flow extension"
[111]:      http://yakiloo.com/getting-started-git-flow/ "git flow workflow"

[121]:      http://creativecommons.org/licenses/by-nc-sa/3.0/ "Creative Commons Attribution-NonCommercial-ShareAlike 3.0"
[122]:      http://creativecommons.org/ "Creative Commons"

[eluna]:    https://github.com/ElunaLuaEngine/Eluna
