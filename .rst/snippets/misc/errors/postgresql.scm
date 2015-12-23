
(error
 :cmd "sudo service postgresql initdb`` 実行に失敗 (FreeBSD prisoner)"
 :solve "
# 一時的に回避(need not to restart the prisoner)
jls
jail -m jid=1 allow.sysvipc=1
"    
:msg "
    [me@freebsd]$ sudo service postgresql initdb
    /usr/local/etc/rc.d/postgresql: DEBUG: checkyesno: postgresql_enable is set to YES.
    /usr/local/etc/rc.d/postgresql: DEBUG: run_rc_command: doit: postgresql_initdb
    The files belonging to this database system will be owned by user \"pgsql\".
    This user must also own the server process.

    The database cluster will be initialized with locale \"C\".
    The default text search configuration will be set to \"english\".

    Data page checksums are disabled.

    creating directory /usr/local/pgsql/data ... ok
    creating subdirectories ... ok
    selecting default max_connections ... 10
    selecting default shared_buffers ... 400kB
    selecting dynamic shared memory implementation ... posix
    creating configuration files ... ok
    creating template1 database in /usr/local/pgsql/data/base/1 ... FATAL:  could not create shared memory segment: Function not implemented
    DETAIL:  Failed system call was shmget(key=1, size=48, 03600).
    child process exited with exit code 1
    initdb: removing data directory \"/usr/local/pgsql/data\"
    ")


-- ERRORS: 文字列をダブルクオートで囲った
insert into parent (id, name ) values (1, "a");  -- error!
insert into parent (id, name ) values (1, 'a');


-- 大文字の場合は、ダブルクオートで囲むこと
drop database "DB_NAME";
drop database db_name;
