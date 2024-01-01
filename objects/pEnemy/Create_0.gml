/// @description Insert description here
// You can write your code in this editor

event_inherited();

//Intrinsic
state = enemystate.idle;
hSpeed = 0;
vSpeed = 0;
xTo = xstart;
yTo = ystart;
dir = 0;
aggroCheck = 0;
aggroCheckDuration = 5;
stateTarget = state;
statePrevious = state;
stateWait = 0;
stateWaitDuration = 0;

sprMove = sSlime;


timePassed = 0;
waitDuration = 60;
wait = 0;


enemyScript[enemystate.idle] = -1;
enemyScript[enemystate.wander] = -1;
enemyScript[enemystate.chase] = -1;
enemyScript[enemystate.attack] = -1;
enemyScript[enemystate.hurt] = -1;
enemyScript[enemystate.die] = -1;
enemyScript[enemystate.wait] = EnemyWait;
