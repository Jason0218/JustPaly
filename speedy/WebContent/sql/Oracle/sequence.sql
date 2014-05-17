--Role(角色表)序列
create sequence t_role_sequence                      
minvalue 1              
nomaxvalue
start with 1000
increment by 1;


--User(用户表)序列
create sequence t_user_sequence                      
minvalue 1              
nomaxvalue
start with 1000
increment by 1;


--Permission(权限表)序列
create sequence t_permission_sequence                      
minvalue 1              
nomaxvalue
start with 1000
increment by 1;


--Route(线路表)序列
create sequence t_route_sequence                      
minvalue 1              
nomaxvalue
start with 1000
increment by 1;


--GoodsState(货物状态表)序列
create sequence t_goodsstate_sequence                      
minvalue 1              
nomaxvalue
start with 1000
increment by 1;

--Goods（货物表）序列
create sequence t_goods_sequence                      
minvalue 1              
nomaxvalue
start with 1000
increment by 1;

--GoodsType(货物类别)序列
create sequence t_goodstype_sequence                      
minvalue 1              
nomaxvalue
start with 1000
increment by 1;


--Order（订单表）序列
create sequence t_order_sequence                      
minvalue 1              
nomaxvalue
start with 1000
increment by 1;


--SendNode（配送点）序列
create sequence t_sendnode_sequence                      
minvalue 1              
nomaxvalue
start with 1000
increment by 1;


--SendNode_Price(配送点价格表)序列
create sequence sendnode_price_sequence                      
minvalue 1              
nomaxvalue
start with 1000
increment by 1;

--SendScope_Price(配送范围价格表)序列
create sequence sendscope_price_sequence                      
minvalue 1              
nomaxvalue
start with 1000
increment by 1;

--Car（车辆）序列
create sequence t_car_sequence                      
minvalue 1              
nomaxvalue
start with 1000
increment by 1;

--AllocateCar(车辆调配表)序列
create sequence t_allocatecar_sequence                      
minvalue 1              
nomaxvalue
start with 1000
increment by 1;

--Setouttime（发车时间表）序列
create sequence t_setouttime_sequence                      
minvalue 1              
nomaxvalue
start with 1000
increment by 1;


--Route_relation(线路关系表)序列
create sequence route_relation_sequence                      
minvalue 1              
nomaxvalue
start with 1000
increment by 1;

--t_employee（员工表）序列
create sequence t_employee_sequence                      
minvalue 1              
nomaxvalue
start with 1000
increment by 1;

--t_associatelist (交接单表)序列
create sequence t_associatelist_sequence                      
minvalue 1              
nomaxvalue
start with 1000
increment by 1;


--t_totalrouteform（线路总表）序列
create sequence t_totalrouteform_sequence                      
minvalue 1              
nomaxvalue
start with 1000
increment by 1;


--t_acceptform (收货表)序列
create sequence t_acceptform_sequence                      
minvalue 1              
nomaxvalue
start with 1000
increment by 1;

--t_sendform（发货表）序列
create sequence t_sendform_sequence                      
minvalue 1              
nomaxvalue
start with 1000
increment by 1;

--t_companyreportform (省公司报表)序列
create sequence t_companyreportform_sequence                      
minvalue 1              
nomaxvalue
start with 1000
increment by 1;
