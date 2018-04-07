drop table if exists access_log ;
create table access_log (
    stamp    varchar(255)
  , referrer text
  , url      text
);

insert into access_log 
values
    ('2016-08-26 12:02:00', 'http://www.other.com/path1/index.php?k1=v1&k2=v2#ref1', 'http://www.example.com/video/detail?id=001')
  , ('2016-08-26 12:02:01', 'http://www.other.net/path1/index.php?k1=v1&k2=v2#ref1', 'http://www.example.com/video#ref'          )
  , ('2016-08-26 12:02:01', 'https://www.other.com/'                               , 'http://www.example.com/book/detail?id=002' )
;


select * from access_log;

select 
   stamp,
   substring(referrer from 'https?://([^/]*)') as referrer_host
from
   access_log;
   
SELECT 
   stamp,
   url,
   substring(url from '//[^/]+([^?#]+)') AS path,
   substring(url from 'id=([^&]*)') AS id
FROM access_log;   

select 
   stamp,
   url, 
   split_part(substring(url from '//[^/]+([^?#]+)'), '/', 2) as path1,
   split_part(substring(url from '//[^/]+([^?#]+)'), '/', 3) as path2
from
   access_log;

