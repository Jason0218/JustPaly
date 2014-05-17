--Role
create table t_role  (
   rid                 NUMBER                      primary key,
   rname           VARCHAR2(50)                    not null
   
);

--User

create table t_user  (
   "id"                 NUMBER(32)                      not null,
   username           VARCHAR2(30)                    not null,
   "password"           VARCHAR2(50)                    not null,
   sex                VARCHAR2(50),
   age                VARCHAR2(50),
   tel                VARCHAR2(50),
   address            VARCHAR2(50),
   email              VARCHAR2(50),
   rid            NUMBER,
   node_id        NUMBER,
   state          number,
   constraint PK_T_USER primary key ("id")
);  
ALTER TABLE t_user
ADD  FOREIGN KEY(rid)REFERENCES  t_role(rid) ON DELETE CASCADE;

--ALTER TABLE t_user
--ADD  FOREIGN KEY(node_id)REFERENCES  t_sendnode("id") ON DELETE CASCADE;


--Permission
create table t_permission  (
   pid                 NUMBER                      primary key,
   pname           VARCHAR2(50)                    not null,
   model            NUMBER,   
   purl              VARCHAR2(50)                  not null
);
--rp
create table t_rp  (
   rid                 NUMBER            not null,
   pid           NUMBER                    not null
);

ALTER TABLE t_rp
ADD  FOREIGN KEY(rid)REFERENCES  t_role(rid) ON DELETE CASCADE;

ALTER TABLE t_rp
ADD  FOREIGN KEY(pid)REFERENCES  t_permission(pid) ON DELETE CASCADE;

--Route
create table t_route  (
   "id"                 NUMBER(32)                      not null,
   routename          Varchar2(50)                    not null,
   routefrom          Varchar2(50)                    not null,
   routeto            Varchar2(50)                    not null,
   constraint PK_T_ROUTE primary key ("id")
);


--GoodsState
create table t_goodsstate  (
   "id"                 NUMBER(32)                      not null,
   bagnum             VARCHAR2(50),
   order_id           NUMBER(32)                      not null,
  nowposition       VARCHAR2(50),
   nextposition       VARCHAR2(50),
   arrivetime         DATE,
   constraint PK_T_GOODSSTATE primary key ("id")
);




--Goods
create table t_goods  (
   "id"                 NUMBER(32)                      not null,
   goodsname          VARCHAR2(50),
   type_id            NUMBER(32)                      not null,
   volume             NUMBER(32),
   weight             NUMBER(32),
   constraint PK_T_GOODS primary key ("id")
);


--GoodsType
create table t_goodstype  (
   "id"                 NUMBER(32)                      not null,
   typename           VARCHAR2(50),
   constraint PK_T_GOODSTYPE primary key ("id")
);


--Order
create table t_order  (
  "id"                 NUMBER(32)                      not null,
   destn              VARCHAR2(50),
   node_id            NUMBER(32),
   accepetdate        DATE,
   user_id            NUMBER(32),
   sender            VARCHAR2(50),
   accepeter          VARCHAR2(50),
   accepeterphonenum  VARCHAR2(50),
   price              NUMBER(22,2),
   "scope"              VARCHAR2(50),
   senddate         DATE,
   address            VARCHAR2(50),
   email              VARCHAR2(50),
   goods_id           NUMBER(32),
   goodsamount        NUMBER(20),
   mateprice          NUMBER(22,2),
   protectprice       NUMBER(22,2),
   sendprice          NUMBER(22,2),
   totalprice         NUMBER(22,2),
   constraint PK_T_ORDER primary key ("id")
);

--SendNode
create table t_sendnode  (
   "id"                 NUMBER(32)                      not null,
   nodename           VARCHAR2(50),
   innerprice         NUMBER(12,2),
   user_id            NUMBER(32),
   username           VARCHAR2(50),
   "password"           VARCHAR2(50),
   forwordnode        VARCHAR2(50),
   nextnode           VARCHAR2(50),
   nodetype           VARCHAR2(50),
empcount		number,
   constraint PK_T_SENDNODE primary key ("id")
);

--SendNode_Price
create table sendnode_price  (
   "id"                 NUMBER(32)                      not null,
   node_id            NUMBER(32),
   scopename          VARCHAR2(50),
   fristweightprice   NUMBER(22,2),
   nextweightprice    NUMBER(22,2),
   fristvolumeprice   NUMBER(22,2),
   nextvolumeprice    NUMBER(22,2),
   constraint PK_SENDSCOPE_PRICE primary key ("id")
);

--SendScope_Price
create table sendscope_price  (
   "id"                 NUMBER(32)                      not null,
   node_id            NUMBER(32),
   scopename          VARCHAR2(50),
   fristweightprice   NUMBER(12,2),
   nextweightprice    NUMBER(12,2),
   fristvolumeprice   NUMBER(12,2),
   nextvolumeprice    NUMBER(12,2),
   constraint PK_SEND_SCOPE_PRICE primary key ("id")
);


--Car
create table t_car  (
   "id"                 NUMBER(32)                      not null,
   carId             VARCHAR2(50),
   cardriver	     VARCHAR2(50),
   deadweight         NUMBER(12,2),
   volume             NUMBER(12,2),
   state              VARCHAR2(50),
   constraint PK_T_CAR primary key ("id")
);

--AllocateCar
create table t_allocatecar  (
   "id"                 NUMBER(32)                      not null,
   orderid				NUMBER(32),
   car_id             NUMBER(32),
   nowposition        VARCHAR2(50),
   destn              VARCHAR2(50),
   constraint PK_T_ALLOCATECAR primary key ("id")
);

--Setouttime
create table t_setouttime  (
   "id"                 NUMBER(32)                      not null,
   car_id             NUMBER(32)                      not null,
   setouttime         DATE,
   constraint PK_T_SETOUTTIME primary key ("id")
);


--Route_relation

create table route_relation  (
   "id"                 NUMBER(32)                      not null,
   node_id            NUMBER(32)                      not null,
   route_id           NUMBER(32)                      not null,
   constraint PK_ROUTE_RELATION primary key ("id")
);

--t_employee
create table t_employee  (
   "id"                 NUMBER(32)                      not null,
   "name"               VARCHAR2(50),
   sex                VARCHAR2(50),
   age                VARCHAR2(50),
   role_id            NUMBER(32)                      not null,
   node_id            NUMBER(32)                      not null,
   tel                VARCHAR2(50),
   email              VARCHAR2(50),
   constraint PK_T_EMPLOYEE primary key ("id")
);


--t_associatelist 

create table t_associatelist  (
   "id"                 NUMBER(32)                      not null,
   car_id             NUMBER(32),
   order_id           NUMBER(32),
   employee_id        NUMBER(32),
   nodde_id           NUMBER(32),
   destn              VARCHAR2(50),
   associatedate      DATE,
   constraint PK_T_ASSOCIATELIST primary key ("id")
);

--t_totalrouteform
create table t_totalrouteform  (
   "id"                 NUMBER(32)                      not null,
   routenum           VARCHAR2(50),  
   route_id           NUMBER(32),
   startnode          VARCHAR2(50),
   acrossnoade        VARCHAR2(50),
   endpoint           VARCHAR2(50),
   constraint PK_T_TOTALROUTEFORM primary key ("id"));


--t_acceptform 

create table t_acceptform  (
   "id"                 NUMBER(32)                      not null,
   node_id            NUMBER(32),
   formdate           DATE,
   formbirthdate      DATE,
   totalweight        NUMBER(22,2),
   totalvolume       NUMBER(22,2),
   income             NUMBER(22,2),
   constraint PK_T_ACCEPTFORME primary key ("id")
);

--t_sendform
create table t_sendform  (
   "id"                 NUMBER(32)                      not null,
   node_id            NUMBER(32),
   formdate           DATE,
   formbirthdate      DATE,
   tatalweight        NUMBER(22,2),
   totalvolume        NUMBER(22,2),
   income             NUMBER(22,2),
   constraint PK_T_SENDFORM primary key ("id")
);


--t_companyreportform 

create table t_companyreportform  (
   "id"                 NUMBER(32)                      not null,
   formdate           DATE,
   formbirthdate      DATE,
   node_id            NUMBER(32),
   totalweighet       NUMBER(22,2),
   totalvolume        NUMBER(22,2),
   totalincome        NUMBER(22,2),
   constraint PK_T_COMPANYREPORTFORM primary key ("id")
);






--
alter table route_relation
   add constraint FK_ROUTE_RE_REFERENCE_T_ROUTE foreign key (route_id)
      references t_route ("id");

alter table route_relation
   add constraint FK_ROUTE_RE_REFERENCE_T_SENDNO foreign key (node_id)
      references t_sendnode ("id");

alter table sendnode_price
   add constraint FK_SENDNODE_REFERENCE_T_SENDNO foreign key (node_id)
      references t_sendnode ("id");

alter table sendscope_price
   add constraint FK_SENDSCOP_REFERENCE_T_SENDNO foreign key (node_id)
      references t_sendnode ("id");


alter table t_acceptform
   add constraint FK_T_ACCEPT_REFERENCE_T_SENDNO foreign key (node_id)
      references t_sendnode ("id");

alter table t_allocatecar
   add constraint FK_T_ALLOCA_REFERENCE_T_CAR foreign key (car_id)
      references t_car ("id");

alter table t_associatelist
   add constraint FK_T_ASSOCI_REFERENCE_T_CAR foreign key (car_id)
      references t_car ("id");

alter table t_associatelist
   add constraint FK_T_ASSOCI_REFERENCE_T_ORDER foreign key (order_id)
      references t_order ("id");

alter table t_associatelist
   add constraint FK_T_ASSOCI_REFERENCE_T_EMPLOY foreign key 

(employee_id)
      references t_employee ("id");

alter table t_associatelist
   add constraint FK_T_ASSOCI_REFERENCE_T_SENDNO foreign key (nodde_id)
      references t_sendnode ("id");

alter table t_companyreportform
   add constraint FK_T_COMPAN_REFERENCE_T_SENDNO foreign key (node_id)
      references t_sendnode ("id");

alter table t_employee
   add constraint FK_T_EMPLOY_REFERENCE_T_SENDNO foreign key (node_id)
      references t_sendnode ("id");

alter table t_employee
   add constraint FK_T_EMPLOY_REFERENCE_T_ROLE foreign key (role_id)
      references t_role (rid);

alter table t_goods
   add constraint FK_T_GOODS_REFERENCE_T_GOODST foreign key (type_id)
      references t_goodstype ("id");

alter table t_goodsstate
   add constraint FK_T_GOODSS_REFERENCE_T_ORDER foreign key (order_id)
      references t_order ("id");

alter table t_order
   add constraint FK_T_ORDER_REFERENCE_T_GOODS foreign key (goods_id)
      references t_goods ("id");

alter table t_order
   add constraint FK_T_ORDER_t_employee  foreign key (user_id)
      references t_employee ("id");

alter table t_order
   add constraint FK_T_ORDER_REFERENCE_T_SENDNO foreign key (node_id)
      references t_sendnode ("id");

alter table t_sendform
   add constraint FK_T_SENDFO_REFERENCE_T_SENDNO foreign key (node_id)
      references t_sendnode ("id");

alter table t_sendnode
   add constraint FK_T_SENDNO_REFERENCE_T_USER foreign key (user_id)
      references t_user ("id");

alter table t_setouttime
   add constraint FK_T_SETOUT_REFERENCE_T_CAR foreign key (car_id)
      references t_car ("id");

alter table t_totalrouteform
   add constraint FK_T_TOTALR_REFERENCE_ROUTE_RE foreign key (route_id)
      references t_route ("id");

