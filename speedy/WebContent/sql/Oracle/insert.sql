
--t_car

insert into t_car values('1000','沪B-21211','张三','11111.00','12111.00','出行');
insert into t_car values('1001','沪A-21222','aa','12311.00','12311.00','出行');
insert into t_car values('1002','沪B-21212','神射手','1231.00','1122.00','出行');
insert into t_car values('1007','沪B-21214','asdasd','132.00','222.00','空闲');
insert into t_car values('1004','沪B-21266','uu','123.00','222.00','空闲');
insert into t_car values('1005','沪B-21233','qq','222.00','111.00','空闲');
insert into t_car values('1006','沪B-12122','asd','123.00','121.00','空闲');
insert into t_car values('1008','沪B-21278','qwe','123.00','677.00','空闲');
insert into t_car values('1009','沪B-21088','asdx','23.00','4.00','空闲');
insert into t_car values('3','苏A 666','赵一','100.00','120.00','空闲');
insert into t_car values('2','苏A 999','赵二','110.00','130.00','空闲');
insert into t_car values('1','苏B 888','赵三','120.00','140.00','出行');


--t_goodstype
insert into T_GOODSTYPE values('1','电器');
insert into T_GOODSTYPE values('2','食品');
insert into T_GOODSTYPE values('3','餐具');

--t_route
insert into t_route values('1','南京南通','南京','南通');
insert into t_route values('2','南京上海','南京','上海');
insert into t_route values('3','扬州南京','扬州','南京');
insert into t_route values('1000','合肥武汉','合肥','武汉');
insert into t_route values('1020','南京广州','南京','广州');

--t_setouttime
insert into t_setouttime values('5','3',to_date('2008-06-09','yyyy-MM-dd'));
insert into t_setouttime values('1','1',to_date('2014-04-04','yyyy-MM-dd'));
insert into t_setouttime values('2','2',to_date('2014-04-06','yyyy-MM-dd'));
insert into t_setouttime values('3','2',to_date('2014-05-09','yyyy-MM-dd'));
insert into t_setouttime values('4','3',to_date('2014-06-08','yyyy-MM-dd'));
insert into t_setouttime values('1000','1000',to_date('2014-4-22','yyyy-MM-dd'));
insert into t_setouttime values('1001','1001',to_date('2014-4-22','yyyy-MM-dd'));
insert into t_setouttime values('1020','1002',to_date('2014-4-23','yyyy-MM-dd'));


--T_ALLOCATECAR
insert into T_ALLOCATECAR values('1','2','1','南京','扬州');
insert into T_ALLOCATECAR values('2','2','2','南京','北京');
insert into T_ALLOCATECAR values('3','1','2','上海','广州');
insert into T_ALLOCATECAR values('4','3','3','香港','澳门');
insert into T_ALLOCATECAR values('1000','1000','1000','四川','山西');
insert into T_ALLOCATECAR values('1001','1005','1001','西安','山西');
insert into T_ALLOCATECAR values('1020','1021','1002','北京','上海');


--T_GOODS
insert into T_GOODS values('1','电视','1','100','80');
insert into T_GOODS values('2','电脑','1','70','50');
insert into T_GOODS values('3','肯德基','2','30','20');
insert into T_GOODS values('4','筷子','3','40','60');

insert into T_GOODS values('1000','qwe','2','11','2');
insert into T_GOODS values('1001','qweqw','2','22','123');
insert into T_GOODS values('1002','qq','2','2','12');
insert into T_GOODS values('1005','好家伙','2','1','2');
insert into T_GOODS values('1006','吃的','2','123','12');
insert into T_GOODS values('1020','qwe','1','21','12');
insert into T_GOODS values('1021','qwe','1','123','123');

--t_role
insert into t_role values('1','boss');
insert into t_role values('1000','BOSS');

--t_user
insert into t_user values('1','钱一','111111','女','10','123','南京','123@qq.com','1','1','0');
insert into t_user values('2','钱二','222222','女','12','234','上海','234@qq.com','1','2','1');
insert into t_user values('3','钱三','333333','男','23','345','南京','345@qq.com','1','3','1');
insert into t_user values('4','钱四','444444','男','22','456','上海','456@qq.com','1','4','0');
insert into t_user values('5','钱五','555555','男','24','567','北京','567@qq.com','1','4','0');
insert into t_user values('6','钱六','666666','男','23','678','广州','678@qq.com','1','3','1');
insert into t_user values('1000','hjj','123123','男','23','11111111111','qewqwe','qwe@qq.com','1000','1000','0');
insert into t_user values('1001','zhangjiayi','zhangjiayi','男','88','18771104429','湖北武汉','371825615@qq.com','1000','2','0');

-- T_SENDNODE
insert into  T_SENDNODE values('1','四川','12','1','钱一','111111','南京','深圳','主线','2');
insert into  T_SENDNODE values('2','山西','23','2','钱二','222222','南通','广州','主线','3');
insert into  T_SENDNODE values('3','陕西','22','3','钱三','333333','无锡','北京','支线','4');
insert into  T_SENDNODE values('4','西安','12','4','钱四','444444','六合','上海','支线','1');
insert into  T_SENDNODE values('1000','北京','123.00','1000','hjj','123123','','南京','主线','123');
insert into  T_SENDNODE values('1001','南京','123.00','1000','hjj','123123','北京','上海','主线','123');
insert into  T_SENDNODE values('1002','上海','231.00','1000','hjj','123123','南京','','主线','123');


--T_SENDFORM
insert into T_SENDFORM values('1','1',to_date('2014-04-16','yyyy-MM-dd'),to_date('2014-05-02','yyyy-MM-dd'),'44','66','33');
insert into T_SENDFORM values('2','2',to_date('2014-04-17','yyyy-MM-dd'),to_date('2014-04-26','yyyy-MM-dd'),'44','66','33');
insert into T_SENDFORM values('3','3',to_date('2014-04-18','yyyy-MM-dd'),to_date('2014-05-27','yyyy-MM-dd'),'44','66','33');
insert into T_SENDFORM values('4','4',to_date('2014-04-21','yyyy-MM-dd'),to_date('2014-05-29','yyyy-MM-dd'),'44','66','33');

--T_ACCEPTFORM
insert into T_ACCEPTFORM values('1','1',to_date('2014-04-16','yyyy-MM-dd'),to_date('2014-04-27','yyyy-MM-dd'),'33','44','66');
insert into T_ACCEPTFORM values('2','2',to_date('2014-04-17','yyyy-MM-dd'),to_date('2014-04-28','yyyy-MM-dd'),'22','44','65');
insert into T_ACCEPTFORM values('3','2',to_date('2014-04-18','yyyy-MM-dd'),to_date('2014-04-29','yyyy-MM-dd'),'11','55','54');
insert into T_ACCEPTFORM values('4','3',to_date('2014-04-19','yyyy-MM-dd'),to_date('2014-04-30','yyyy-MM-dd'),'22','44','43');

--SENDNODE_PRICE
insert into SENDNODE_PRICE values('1','1','aa','12','22','33','43');
insert into SENDNODE_PRICE values('2','2','bb','13','23','32','44');
insert into SENDNODE_PRICE values('3','1','cc','14','24','31','45');
insert into SENDNODE_PRICE values('4','3','dd','15','25','30','46');

--SENDSCOPE_PRICE
insert into SENDSCOPE_PRICE values('1','1','aa','12','22','22','33');
insert into SENDSCOPE_PRICE values('2','2','bb','14','23','23','34');
insert into SENDSCOPE_PRICE values('3','1','cc','15','24','24','35');
insert into SENDSCOPE_PRICE values('4','3','dd','16','25','25','36');

--T_COMPANYREPORTFORM
insert into T_COMPANYREPORTFORM values('1',to_date('2014-04-16','yyyy-MM-dd'),to_date('2014-04-21','yyyy-MM-dd'),'1','11','33','44');
insert into T_COMPANYREPORTFORM values('2',to_date('2014-04-17','yyyy-MM-dd'),to_date('2014-04-22','yyyy-MM-dd'),'1','22','33','43');
insert into T_COMPANYREPORTFORM values('3',to_date('2014-04-18','yyyy-MM-dd'),to_date('2014-04-23','yyyy-MM-dd'),'2','23','31','45');
insert into T_COMPANYREPORTFORM values('4',to_date('2014-04-19','yyyy-MM-dd'),to_date('2014-04-24','yyyy-MM-dd'),'3','21','34','46');

--T_EMPLOYEE
insert into T_EMPLOYEE values('1','孙一','女','10','1','1','123','147@qq.com');
insert into T_EMPLOYEE values('2','孙二','女','11','1','3','147','258@qq.com');
insert into T_EMPLOYEE values('3','孙三','男','12','1','2','258','369@qq.com');
insert into T_EMPLOYEE values('4','孙四','男','13','1','1','369','789@qq.com');


--T_ORDER
insert into T_ORDER values('1','南京','1',to_date('2014-04-16','yyyy-MM-dd'),'1','李一','李五','111','11','aa',to_date('2014-04-16','yyyy-MM-dd'),'南京','123@qq.com','1','12','11','10','12','11');
insert into T_ORDER values('2','上海','1',to_date('2014-04-17','yyyy-MM-dd'),'2','李二','李六','222','22','bb',to_date('2014-04-17','yyyy-MM-dd'),'上海','147@qq.com','2','12','11','10','12','11');
insert into T_ORDER values('3','北京','2',to_date('2014-04-18','yyyy-MM-dd'),'3','李三','李七','333','33','cc',to_date('2014-04-18','yyyy-MM-dd'),'北京','258@qq.com','1','12','11','10','12','11');
insert into T_ORDER values('4','广州','3',to_date('2014-04-19','yyyy-MM-dd'),'3','李四','李七','444','44','dd',to_date('2014-04-19','yyyy-MM-dd'),'广州','987@qq.com','2','12','11','10','12','11');
insert into T_ORDER values('1000','山西','1',to_date('2014-4-22','yyyy-MM-dd'),'1','assd','qwe','12312312311','110.20','scope',to_date('2010-8-4','yyyy-MM-dd'),'qew','se@qq.com','1000','1','22.00','22.00','22.00','66.00');
insert into T_ORDER values('1005','山西','4',to_date('2014-4-22','yyyy-MM-dd'),'1000','张无','惠俊杰','85326501011','110.20','scope',to_date('2010-8-20','yyyy-MM-dd'),'南京雨花台','asdasd@awd.ad','1005','1','1.00','12.00','23.00','36.00');
insert into T_ORDER values('1006','山西','2',to_date('2014-4-22','yyyy-MM-dd'),'1001','涨价','散散','11588440112','110.20','scope',to_date('2010-8-4','yyyy-MM-dd'),'阿斯顿撒','adasd@163.com','1006','1','2.00','1.00','1.00','4.00');
insert into T_ORDER values('1020','上海','4',to_date('2014-4-23','yyyy-MM-dd'),'1000','qwe','aaazaaaa','11231231231','110.20','scope',to_date('2010-8-1','yyyy-MM-dd'),'123','qw@qq.com','1020','1','123.00','12.00','12.00','147.00');
insert into T_ORDER values('1021','上海','1000',to_date('2014-4-23','yyyy-MM-dd'),'1000','123','hjhjhjhjhjhjhjh','12312312322','110.20','scope',to_date('2010-8-1','yyyy-MM-dd'),'asdasd','qwe@qq.com','1021','1','12.00','12.00','12.00','36.00');


--T_GOODSSTATE
insert into T_GOODSSTATE values ('1','22','1','南京','扬州',to_date('2014-04-16','yyyy-MM-dd'));
insert into T_GOODSSTATE values ('3','44','2','徐州','北京',to_date('2014-04-19','yyyy-MM-dd'));
insert into T_GOODSSTATE values ('4','55','3','上海','广州',to_date('2014-04-20','yyyy-MM-dd'));
insert into T_GOODSSTATE values ('1000','1000','1000','四川','深圳',to_date('2014-04-16','yyyy-MM-dd'));
insert into T_GOODSSTATE values ('1001','1005','1005','西安','上海',to_date('2014-04-19','yyyy-MM-dd'));
insert into T_GOODSSTATE values ('1020','1021','1021','南京','上海',to_date('2014-04-20','yyyy-MM-dd'));


--T_PERMISSION
insert into t_permission values(t_permission_sequence.nextval,'修改配送点','7','sendNode_getAllDetails');
insert into t_permission values(t_permission_sequence.nextval,'查询配送点','7','sendNode_getAll');
insert into t_permission values(t_permission_sequence.nextval,'订单查询','3','/speedy/order/queryOrder.jsp');
insert into t_permission values(t_permission_sequence.nextval,'添加用户','1','getRole.action');
insert into t_permission values(t_permission_sequence.nextval,'用户信息查询','1','../user/showUser.action');
insert into t_permission values(t_permission_sequence.nextval,'新增角色','2','getAllPermission.action');
insert into t_permission values(t_permission_sequence.nextval,'角色信息查询','2','showRole.action');
insert into t_permission values(t_permission_sequence.nextval,'新增权限','2','../quanxian/insert_pms.jsp');
insert into t_permission values(t_permission_sequence.nextval,'权限信息查询','2','showPms.action');
insert into t_permission values(t_permission_sequence.nextval,'网上下单','3','/speedy/order/submitOrder.jsp');
insert into t_permission values(t_permission_sequence.nextval,'订单列表','3','/speedy/order/listOrder.jsp');
insert into t_permission values(t_permission_sequence.nextval,'交接单生成','4','../jiaojie/create.jsp');
insert into t_permission values(t_permission_sequence.nextval,'车辆新增','5','../car/insert_car.jsp');
insert into t_permission values(t_permission_sequence.nextval,'车辆信息管理','5','/speedy/car/showCar.action');
insert into t_permission values(t_permission_sequence.nextval,'车辆调度管理','5','/speedy/allocate/showAllocate.action');
insert into t_permission values(t_permission_sequence.nextval,'线路查询','6','RouteAction_query');


--t_rp
insert into t_rp values(1000,1007);
insert into t_rp values(1000,1008);
insert into t_rp values(1000,1009);
insert into t_rp values(1000,1010);
insert into t_rp values(1000,1011);
insert into t_rp values(1000,1012);
insert into t_rp values(1000,1013);
insert into t_rp values(1000,1014);
insert into t_rp values(1000,1015);
insert into t_rp values(1000,1000);
insert into t_rp values(1000,1001);
insert into t_rp values(1000,1002);
insert into t_rp values(1000,1016);
insert into t_rp values(1000,1020);
insert into t_rp values(1000,1003);
insert into t_rp values(1000,1004);



--ROUTE_RELATION
insert into ROUTE_RELATION values('1','1','1');
insert into ROUTE_RELATION values('2','1','1');
insert into ROUTE_RELATION values('3','2','2');
insert into ROUTE_RELATION values('4','3','3');

--T_TOTALROUTEFORM
insert into T_TOTALROUTEFORM values('1','112','1','六合','武汉,合肥,北京,','香港');
insert into T_TOTALROUTEFORM values('2','212','2','南京','北京','上海');
insert into T_TOTALROUTEFORM values('3','312','3','上海','广州','澳门');

--T_ASSOCIATELIST
insert into T_ASSOCIATELIST values('1','1','1','1','1','上海',to_date('2014-04-30','yyyy-MM-dd'));
insert into T_ASSOCIATELIST values('2','1','2','2','2','广州',to_date('2014-04-29','yyyy-MM-dd'));
insert into T_ASSOCIATELIST values('3','2','2','3','3','香港',to_date('2014-04-28','yyyy-MM-dd'));
insert into T_ASSOCIATELIST values('4','3','3','1','1','拉斯维加斯',to_date('2014-04-27','yyyy-MM-dd'));
insert into T_ASSOCIATELIST values('1003',null,'1021','1000','1001','上海',to_date('2014-4-23','yyyy-MM-dd'));
