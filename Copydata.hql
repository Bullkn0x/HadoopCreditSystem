SET hive.exec.dynamic.partition = true;
SET hive.exec.dynamic.partition.mode = nonstrict;
use creditsystem1;
INSERT OVERWRITE TABLE branch_internal
PARTITION (branch_state) select
branch_code,
branch_name,
branch_street,
branch_city,
branch_zip,
branch_phone,
last_updated,
branch_state
from branch;


INSERT OVERWRITE TABLE customer_internal
PARTITION (cust_state) select
fname,
mname,
lname,
ssn,
credit,
address,
cust_city,
cust_country,
cust_zip,
cust_phone,
cust_email,
last_updated,
cust_state
from customer;



INSERT OVERWRITE TABLE creditcard_internal
PARTITION (transaction_type) select
transaction_id,
timeid ,
credit,
ssn,
branch_code,
transaction_value,
last_updated,
transaction_type
from creditcard;

INSERT OVERWRITE TABLE timetable_internal
PARTITION (quarter) select
transactionid,
timeid,
day,
month,
year,
last_updated,
quarter
from timetable;
