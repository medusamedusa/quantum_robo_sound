
OPENQASM 2.0;
include "qelib1.inc";

qreg q[7];
creg mq3[1];
creg mq4[1];
creg mq5[1];
creg mq6[1];

//x q[0];
//x q[1];
//x q[2];
x q[3];

barrier q[0],q[1],q[2],q[3],q[4], q[5], q[6];

ccx q[0], q[1], q[4];
ccx q[0], q[1], q[5];
ccx q[0], q[1], q[6];

reset q[4];
reset q[5];
reset q[6];

ccx q[0], q[3], q[4];
ccx q[1], q[3], q[5];
ccx q[2], q[3], q[6];

x q[3];

ch q[3], q[4];
ch q[3], q[5];
ch q[3], q[6];

x q[3];

barrier q[0],q[1],q[2],q[3],q[4], q[5], q[6];

measure q[3] -> mq3[0];
measure q[4] -> mq4[0];
measure q[5] -> mq5[0];
measure q[6] -> mq6[0];