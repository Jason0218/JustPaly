
--t_car

insert into t_car values('1000','��B-21211','����','11111.00','12111.00','����');
insert into t_car values('1001','��A-21222','aa','12311.00','12311.00','����');
insert into t_car values('1002','��B-21212','������','1231.00','1122.00','����');
insert into t_car values('1007','��B-21214','asdasd','132.00','222.00','����');
insert into t_car values('1004','��B-21266','uu','123.00','222.00','����');
insert into t_car values('1005','��B-21233','qq','222.00','111.00','����');
insert into t_car values('1006','��B-12122','asd','123.00','121.00','����');
insert into t_car values('1008','��B-21278','qwe','123.00','677.00','����');
insert into t_car values('1009','��B-21088','asdx','23.00','4.00','����');
insert into t_car values('3','��A 666','��һ','100.00','120.00','����');
insert into t_car values('2','��A 999','�Զ�','110.00','130.00','����');
insert into t_car values('1','��B 888','����','120.00','140.00','����');


--t_goodstype
insert into T_GOODSTYPE values('1','����');
insert into T_GOODSTYPE values('2','ʳƷ');
insert into T_GOODSTYPE values('3','�;�');

--t_route
insert into t_route values('1','�Ͼ���ͨ','�Ͼ�','��ͨ');
insert into t_route values('2','�Ͼ��Ϻ�','�Ͼ�','�Ϻ�');
insert into t_route values('3','�����Ͼ�','����','�Ͼ�');
insert into t_route values('1000','�Ϸ��人','�Ϸ�','�人');
insert into t_route values('1020','�Ͼ�����','�Ͼ�','����');

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
insert into T_ALLOCATECAR values('1','2','1','�Ͼ�','����');
insert into T_ALLOCATECAR values('2','2','2','�Ͼ�','����');
insert into T_ALLOCATECAR values('3','1','2','�Ϻ�','����');
insert into T_ALLOCATECAR values('4','3','3','���','����');
insert into T_ALLOCATECAR values('1000','1000','1000','�Ĵ�','ɽ��');
insert into T_ALLOCATECAR values('1001','1005','1001','����','ɽ��');
insert into T_ALLOCATECAR values('1020','1021','1002','����','�Ϻ�');


--T_GOODS
insert into T_GOODS values('1','����','1','100','80');
insert into T_GOODS values('2','����','1','70','50');
insert into T_GOODS values('3','�ϵ»�','2','30','20');
insert into T_GOODS values('4','����','3','40','60');

insert into T_GOODS values('1000','qwe','2','11','2');
insert into T_GOODS values('1001','qweqw','2','22','123');
insert into T_GOODS values('1002','qq','2','2','12');
insert into T_GOODS values('1005','�üһ�','2','1','2');
insert into T_GOODS values('1006','�Ե�','2','123','12');
insert into T_GOODS values('1020','qwe','1','21','12');
insert into T_GOODS values('1021','qwe','1','123','123');

--t_role
insert into t_role values('1','boss');
insert into t_role values('1000','BOSS');

--t_user
insert into t_user values('1','Ǯһ','111111','Ů','10','123','�Ͼ�','123@qq.com','1','1','0');
insert into t_user values('2','Ǯ��','222222','Ů','12','234','�Ϻ�','234@qq.com','1','2','1');
insert into t_user values('3','Ǯ��','333333','��','23','345','�Ͼ�','345@qq.com','1','3','1');
insert into t_user values('4','Ǯ��','444444','��','22','456','�Ϻ�','456@qq.com','1','4','0');
insert into t_user values('5','Ǯ��','555555','��','24','567','����','567@qq.com','1','4','0');
insert into t_user values('6','Ǯ��','666666','��','23','678','����','678@qq.com','1','3','1');
insert into t_user values('1000','hjj','123123','��','23','11111111111','qewqwe','qwe@qq.com','1000','1000','0');
insert into t_user values('1001','zhangjiayi','zhangjiayi','��','88','18771104429','�����人','371825615@qq.com','1000','2','0');

-- T_SENDNODE
insert into  T_SENDNODE values('1','�Ĵ�','12','1','Ǯһ','111111','�Ͼ�','����','����','2');
insert into  T_SENDNODE values('2','ɽ��','23','2','Ǯ��','222222','��ͨ','����','����','3');
insert into  T_SENDNODE values('3','����','22','3','Ǯ��','333333','����','����','֧��','4');
insert into  T_SENDNODE values('4','����','12','4','Ǯ��','444444','����','�Ϻ�','֧��','1');
insert into  T_SENDNODE values('1000','����','123.00','1000','hjj','123123','','�Ͼ�','����','123');
insert into  T_SENDNODE values('1001','�Ͼ�','123.00','1000','hjj','123123','����','�Ϻ�','����','123');
insert into  T_SENDNODE values('1002','�Ϻ�','231.00','1000','hjj','123123','�Ͼ�','','����','123');


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
insert into T_EMPLOYEE values('1','��һ','Ů','10','1','1','123','147@qq.com');
insert into T_EMPLOYEE values('2','���','Ů','11','1','3','147','258@qq.com');
insert into T_EMPLOYEE values('3','����','��','12','1','2','258','369@qq.com');
insert into T_EMPLOYEE values('4','����','��','13','1','1','369','789@qq.com');


--T_ORDER
insert into T_ORDER values('1','�Ͼ�','1',to_date('2014-04-16','yyyy-MM-dd'),'1','��һ','����','111','11','aa',to_date('2014-04-16','yyyy-MM-dd'),'�Ͼ�','123@qq.com','1','12','11','10','12','11');
insert into T_ORDER values('2','�Ϻ�','1',to_date('2014-04-17','yyyy-MM-dd'),'2','���','����','222','22','bb',to_date('2014-04-17','yyyy-MM-dd'),'�Ϻ�','147@qq.com','2','12','11','10','12','11');
insert into T_ORDER values('3','����','2',to_date('2014-04-18','yyyy-MM-dd'),'3','����','����','333','33','cc',to_date('2014-04-18','yyyy-MM-dd'),'����','258@qq.com','1','12','11','10','12','11');
insert into T_ORDER values('4','����','3',to_date('2014-04-19','yyyy-MM-dd'),'3','����','����','444','44','dd',to_date('2014-04-19','yyyy-MM-dd'),'����','987@qq.com','2','12','11','10','12','11');
insert into T_ORDER values('1000','ɽ��','1',to_date('2014-4-22','yyyy-MM-dd'),'1','assd','qwe','12312312311','110.20','scope',to_date('2010-8-4','yyyy-MM-dd'),'qew','se@qq.com','1000','1','22.00','22.00','22.00','66.00');
insert into T_ORDER values('1005','ɽ��','4',to_date('2014-4-22','yyyy-MM-dd'),'1000','����','�ݿ���','85326501011','110.20','scope',to_date('2010-8-20','yyyy-MM-dd'),'�Ͼ��껨̨','asdasd@awd.ad','1005','1','1.00','12.00','23.00','36.00');
insert into T_ORDER values('1006','ɽ��','2',to_date('2014-4-22','yyyy-MM-dd'),'1001','�Ǽ�','ɢɢ','11588440112','110.20','scope',to_date('2010-8-4','yyyy-MM-dd'),'��˹����','adasd@163.com','1006','1','2.00','1.00','1.00','4.00');
insert into T_ORDER values('1020','�Ϻ�','4',to_date('2014-4-23','yyyy-MM-dd'),'1000','qwe','aaazaaaa','11231231231','110.20','scope',to_date('2010-8-1','yyyy-MM-dd'),'123','qw@qq.com','1020','1','123.00','12.00','12.00','147.00');
insert into T_ORDER values('1021','�Ϻ�','1000',to_date('2014-4-23','yyyy-MM-dd'),'1000','123','hjhjhjhjhjhjhjh','12312312322','110.20','scope',to_date('2010-8-1','yyyy-MM-dd'),'asdasd','qwe@qq.com','1021','1','12.00','12.00','12.00','36.00');


--T_GOODSSTATE
insert into T_GOODSSTATE values ('1','22','1','�Ͼ�','����',to_date('2014-04-16','yyyy-MM-dd'));
insert into T_GOODSSTATE values ('3','44','2','����','����',to_date('2014-04-19','yyyy-MM-dd'));
insert into T_GOODSSTATE values ('4','55','3','�Ϻ�','����',to_date('2014-04-20','yyyy-MM-dd'));
insert into T_GOODSSTATE values ('1000','1000','1000','�Ĵ�','����',to_date('2014-04-16','yyyy-MM-dd'));
insert into T_GOODSSTATE values ('1001','1005','1005','����','�Ϻ�',to_date('2014-04-19','yyyy-MM-dd'));
insert into T_GOODSSTATE values ('1020','1021','1021','�Ͼ�','�Ϻ�',to_date('2014-04-20','yyyy-MM-dd'));


--T_PERMISSION
insert into t_permission values(t_permission_sequence.nextval,'�޸����͵�','7','sendNode_getAllDetails');
insert into t_permission values(t_permission_sequence.nextval,'��ѯ���͵�','7','sendNode_getAll');
insert into t_permission values(t_permission_sequence.nextval,'������ѯ','3','/speedy/order/queryOrder.jsp');
insert into t_permission values(t_permission_sequence.nextval,'�����û�','1','getRole.action');
insert into t_permission values(t_permission_sequence.nextval,'�û���Ϣ��ѯ','1','../user/showUser.action');
insert into t_permission values(t_permission_sequence.nextval,'������ɫ','2','getAllPermission.action');
insert into t_permission values(t_permission_sequence.nextval,'��ɫ��Ϣ��ѯ','2','showRole.action');
insert into t_permission values(t_permission_sequence.nextval,'����Ȩ��','2','../quanxian/insert_pms.jsp');
insert into t_permission values(t_permission_sequence.nextval,'Ȩ����Ϣ��ѯ','2','showPms.action');
insert into t_permission values(t_permission_sequence.nextval,'�����µ�','3','/speedy/order/submitOrder.jsp');
insert into t_permission values(t_permission_sequence.nextval,'�����б�','3','/speedy/order/listOrder.jsp');
insert into t_permission values(t_permission_sequence.nextval,'���ӵ�����','4','../jiaojie/create.jsp');
insert into t_permission values(t_permission_sequence.nextval,'��������','5','../car/insert_car.jsp');
insert into t_permission values(t_permission_sequence.nextval,'������Ϣ����','5','/speedy/car/showCar.action');
insert into t_permission values(t_permission_sequence.nextval,'�������ȹ���','5','/speedy/allocate/showAllocate.action');
insert into t_permission values(t_permission_sequence.nextval,'��·��ѯ','6','RouteAction_query');


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
insert into T_TOTALROUTEFORM values('1','112','1','����','�人,�Ϸ�,����,','���');
insert into T_TOTALROUTEFORM values('2','212','2','�Ͼ�','����','�Ϻ�');
insert into T_TOTALROUTEFORM values('3','312','3','�Ϻ�','����','����');

--T_ASSOCIATELIST
insert into T_ASSOCIATELIST values('1','1','1','1','1','�Ϻ�',to_date('2014-04-30','yyyy-MM-dd'));
insert into T_ASSOCIATELIST values('2','1','2','2','2','����',to_date('2014-04-29','yyyy-MM-dd'));
insert into T_ASSOCIATELIST values('3','2','2','3','3','���',to_date('2014-04-28','yyyy-MM-dd'));
insert into T_ASSOCIATELIST values('4','3','3','1','1','��˹ά��˹',to_date('2014-04-27','yyyy-MM-dd'));
insert into T_ASSOCIATELIST values('1003',null,'1021','1000','1001','�Ϻ�',to_date('2014-4-23','yyyy-MM-dd'));