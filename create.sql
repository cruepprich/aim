-- Creation scripts
create tablespace aim datafile '+DATA' size 100m autoextend on next 10m;
create user aim identified by aim default tablespace aim;
grant connect,resource to aim;

--run as sysdba
declare
  l_acl  varchar2(30) := 'aimdev';
  l_user varchar2(30) := 'AIMDEV';
  l_host varchar(100) := 'acoem.enkitec.com';
begin

      dbms_network_acl_admin.create_acl(l_acl,
                                        'Access to cloud EM',
                                        l_user,
                                        TRUE,
                                        'connect');
      dbms_network_acl_admin.add_privilege(l_acl, l_user, TRUE, 'resolve');
      
      dbms_network_acl_admin.assign_acl(l_acl, l_host);
      
      -- Add APEX_050000
      l_user := 'APEX_050000';
      dbms_network_acl_admin.add_privilege(l_acl, l_user, TRUE, 'connect');
      dbms_network_acl_admin.add_privilege(l_acl, l_user, TRUE, 'resolve');
      commit;
end;
/
