-- Creation scripts
create tablespace aim datafile '+DATA' size 100m autoextend on next 10m;
create user aim identified by aim default tablespace aim;
grant connect,resource to aim;