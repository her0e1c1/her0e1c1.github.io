/* 複数行 */
// inline
# Dump sql and update id
ssh HOST "mysqldump --compact -t --skip-extended-insert -u USER DB table1 table2" |perl -nlE 's/VALUES \((''.*?'')/sprintf("VALUES (%d", $1 + 100000)/e; say' 
ssh HOST "mysqldump -u USER DB table1"-- select * from TB_NAME;
-- select * from TB_NAME order by COLUMN;
-- select * from TB_NAME order by COLUMN desc;
-- select * from TB_NAME limit 10;
-- select * from TB_NAME limit 10 offset 10;

-- select '2000-1-1' < '2000-1-2';  # 1
-- select '2000-1-1' < '1999-1-1';  # 0
-- select '2000-1-1' < NULL; # 0
-- select NULL is NULL; # 1
-- select NULL = NULL; # 0

-- select * from teble b -- asは省略可能

-- 独立した各クリークにおけるID最小のnodeを取得
-- 組み合わせテーブルにおいて、group byを行い、その最小値となるので、必ず自己参照のデータが必要
select * from A join junction as J on A.id = J.a1_id group by J.a1_id having min(J.a2_id) = J.a1_id and count(J.a2_id) > 1;-- PRIMARY・・・外部クエリを示す。
-- SUBQUERY・・・相関関係のないサブクエリ。
-- DEPENDENT SUBQUERY・・・相関関係のあるサブクエリ。
-- UNCACHEABLE SUBQUERY・・・実行する度に結果が変わる可能性のあるサブクエリ。
-- DERIVED・・・FROM句で用いられているサブクエリ。


-- 2段以上の集計を同時に出力させる場合
SELECT AVG(`count`), MIN(`count`), MAX(`count`) FROM (
  SELECT COUNT(*) AS `count` FROM `students` GROUP BY `class`
) AS sub;  


-- カテゴリに嘱する上位２つを取り出す
select * from Table1 as t1 where id in (
   select id from Table1 as t2 where t1.category = t2.category order by point desc, id limit 2
) order by category, point desc;
-- mysqlでは、LIMIT & IN/ALL/ANY/SOMEをサブクエリで上記の用に使用できない
-- ERROR 1235 (42000) at line 1: This version of MySQL doesn't yet support 'LIMIT & IN/ALL/ANY/SOME subquery'


-- DEPENDENT SUBQUERY
-- (select from where (select  )) のように、親の１レコードに対して、さらにselectを実行する場合


-- INはExistsに変換される
-- EXISTS  
--    -> (SELECT 1 FROM City WHERE Population > Country.Population / 2 AND CountryCode = Country.Code);


-- subquery 
-- from SUBQUERY
-- where exists SUBQUERY
-- where COLUMN in SUBQUERY


-- from (subquery) as ALIAS は必須
-- ERROR 1248 (42000) at line 1: Every derived table must have its own alias

-- 複雑なクエリを発行せずにUNIONでもよいかと思った(recordの和)
(select * from shop_news where shop_id = 1 limit 2) union (select * from shop_news where shop_id = 2 limit 2);
-- shop_idを決め打ちせずに、全てのshop_idに対して行えないだろうか？
-- explain すると上記は、type all なので、遅いみたい？

-- from (subqueyr) は内側から評価

-- where演算子の評価
-- where id = (sub)
-- where id in (sub)
-- where exists (sub)
-- WHERE expression [NOT] IN (subquery)
-- WHERE expression comparison_operator [ANY | ALL] (subquery)
-- WHERE [NOT] EXISTS (subquery)

-- having expr op (sub)
-- select (sub) from ...


ssh HOST 'cat | mysql -u USER DB' < SQL
select NULL == NULL;
select '2000-1-1' < NULL;
select NULL is NULL;
select '2000-1-1' < '2000-1-2';
select '2000-1-1' < '1999-1-1';
